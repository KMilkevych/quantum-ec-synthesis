#!/usr/bin/env python3
import argparse
from config import (
    SYNTHESIZE_METHODS,
    CIRCUIT_KINDS
)


from pathlib import Path
import csv

from qiskit import qasm3
from qiskit.circuit import ClassicalRegister, QuantumCircuit, QuantumRegister
from qiskit.visualization import plot_histogram
from matplotlib import color_sequences

from synthesizer.SteaneSynthesizer import SteaneSynthesizer
from synthesizer.ShorSynthesizer import ShorSynthesizer
from simulator.CliffordSimulator import CliffordSimulator

from experiment import not_circuit
from experiment import _build_noise_model

def main():

    # Describe main parser
    parser = argparse.ArgumentParser(
        description='Quantum Error-Correction Code Syntehsis for Fault-Tolerant computation.',
        formatter_class=argparse.ArgumentDefaultsHelpFormatter
    )

    # Add sub-parsers
    subparsers = parser.add_subparsers(help="Commands", dest='command')
    synthesize_parser = subparsers.add_parser(
        'synthesize',
        description='Perform synthesis of Quantum Error-Correcting Codes onto existing circuits.',
        formatter_class=argparse.ArgumentDefaultsHelpFormatter
    )
    simulate_parser = subparsers.add_parser(
        'simulate',
        description='Perform exact and noisy simulations of existing circuits.',
        formatter_class=argparse.ArgumentDefaultsHelpFormatter
    )
    generate_parser = subparsers.add_parser(
        'generate',
        description='Generate example quantum circuits.',
        formatter_class=argparse.ArgumentDefaultsHelpFormatter
    )

    # Global parser arguments
    parser.add_argument(
        '-v',
        '--verbose',
        help="turn on verbose output",
        choices=(0,1),
        default=1
    )

    # Synthesize parser arguments
    synthesize_parser.add_argument(
        'input_circuit',
        help=".qasm file containing input circuit",
        type=str,
    )
    synthesize_parser.add_argument(
        '-m',
        '--method',
        help="synthesis method",
        type=str,
        choices=SYNTHESIZE_METHODS,
        default=SYNTHESIZE_METHODS[0]
    )
    synthesize_parser.add_argument(
        '-o',
        '--output',
        help=".qasm file for storing output circuit",
        type=str,
        default=None
    )
    # TODO: Features
    # synthesize_parser.add_argument(
    #     '--optimize',
    #     help="optimize code machinery",
    #     action='store_true'
    # )

    # Simulate parser arguments
    simulate_parser.add_argument(
        'input_circuit',
        nargs="+",
        help=".qasm file(s) containing input circuit(s)",
        type=str,
    )
    simulate_parser.add_argument(
        '--noisy',
        help="enable noise simulation",
        action='store_true'
    )
    simulate_parser.add_argument(
        '-s',
        '--samples',
        help="no. of samples/simulations",
        type=int,
        default=1000
    )
    simulate_parser.add_argument(
        '--plot',
        help=".png file to plot simulation measurements",
        type=str,
        default=None
    )
    simulate_parser.add_argument(
        '--csv',
        help=".csv file to store simulation measurements",
        type=str,
        default=None
    )

    # Generate parser arguments
    generate_parser.add_argument(
        '-k',
        '--kind',
        help="circuit to generate",
        type=str,
        choices=CIRCUIT_KINDS,
        default=CIRCUIT_KINDS[0]
    )
    generate_parser.add_argument(
        '-q',
        '--qubits',
        help="circuit size (no. logical qubits)",
        type=int,
        default=1
    )
    generate_parser.add_argument(
        '-o',
        '--output',
        help="output file/directory for storing output circuits",
        type=str,
        default=None
    )

    # Parse arguments and run desired functionality
    args = parser.parse_args()
    match (args.command):

        case None:
            print(parser.format_help())

        case 'synthesize':

            # Parse circuit
            qc = qasm3.load(args.input_circuit)

            if args.verbose == 1:
                print("INPUT CIRCUIT:")
                print(qc)

            # Parse method for synthesis
            synth = None
            match (args.method):
                case 'shor':
                    synth = ShorSynthesizer()
                case 'steane':
                    synth = SteaneSynthesizer()
                case _:
                    raise Exception(f'Invalid mehtod: {args.method}')

            # Perform synthesis
            qc = synth.synthesize(qc)

            if args.verbose == 1:
                print("OUTPUT CIRCUIT:")
                print(qc)

            # Save circuit to file
            if args.output:
                with open(args.output, 'w') as f:
                    qasm3.dump(qc, f)

        case 'generate':

            kinds = None
            if args.kind is not None and args.kind != 'all':
                kinds = [args.kind]
            else:
                kinds = CIRCUIT_KINDS

            for kind in kinds:
                qc = QuantumCircuit(
                    q_reg := QuantumRegister(args.qubits, 'q_dat'),
                    c_reg := ClassicalRegister(args.qubits, 'c_dat')
                )

                match(kind):
                    case 'identity':
                        pass
                    case 'x':
                        for i in range(args.qubits):
                            qc.x(i)
                    case 'h':
                        for i in range(args.qubits):
                            qc.h(i)
                    case 'snake':
                        for i in range(args.qubits):

                            # Length-10 x-snake
                            for _ in range(5):
                                qc.x(i)
                                qc.x(i)
                    case _:
                        raise Exception(f'Unrecognized circuit kind: {kind}')

                # Add measurements
                qc.measure(q_reg, c_reg)

                if args.verbose == 1:
                    print(f"GENERATED {kind}-circuit:")
                    print(qc)

                # Dump circuit to file
                if args.output is not None:

                    if len(kinds) > 1:
                        ouf = Path(f"{args.output}/{kind}-{args.qubits}.qasm")
                    else:
                        ouf = Path(f"{args.output}")

                    ouf.parent.mkdir(parents=True, exist_ok=True)

                    with open(ouf, 'w') as f:
                        qasm3.dump(qc, f)

        case 'simulate':

            # Results
            results = list()

            # Parse circuit
            for circuit_file in args.input_circuit:

                # Load circuit form file
                qc = qasm3.load(circuit_file)

                if args.verbose == 1:
                    print("INPUT CIRCUIT:")
                    print(qc)

                # Prepare noise model
                noise_pb = 0.01
                nm = _build_noise_model(qc.num_qubits, noise_pb) if args.noisy else None

                # Prepare simulator
                sim = CliffordSimulator()

                # Simulate
                res = sim.simulate(qc, 'c_dat', args.samples, nm)
                if args.verbose == 1:
                    print(f"{args.samples} SIMULATIONS:")
                    print(res)

                # Save result
                results.append(
                    (circuit_file, res)
                )

            if args.plot:

                # Prepare figure
                plot_title = f"{args.samples} samples" \
                    + (f" with noise probability P={noise_pb * 100}%" \
                    if args.noisy \
                    else f" without noise")

                plot_legends = list(map(lambda x: x[0], results))
                plot_results = list(map(lambda x: x[1], results))
                plot_colors = color_sequences['Set2'][:len(plot_results)]

                fig = plot_histogram(
                    plot_results,
                    legend=plot_legends,
                    sort="asc",
                    figsize=(15, 12),
                    color=plot_colors,
                    title=plot_title
                )

                # Save figure to file
                ouf = Path(args.plot)
                ouf.parent.mkdir(parents=True, exist_ok=True)

                fig.savefig(ouf)

            if args.csv:

                # Prepare csv header
                meas_labels = sorted(list(
                    set.union(*map(
                        lambda m: set(m.keys()),
                        map(lambda x: x[1], results)
                    ))
                ))
                header = ['circuit'] + meas_labels

                # Prepare csv rows
                rows = []
                for circuit, measurements in results:
                    row = [circuit]
                    for lab in meas_labels:
                        if lab in measurements.keys():
                            row.append(measurements[lab])
                        else:
                            row.append(0)
                    rows.append(row)

                # Write csv file
                ouf = Path(args.csv)
                ouf.parent.mkdir(parents=True, exist_ok=True)

                with open(ouf, 'w', newline='') as csvfile:
                    writer = csv.writer(
                        csvfile,
                        delimiter=',',
                        quotechar='"',
                        quoting=csv.QUOTE_MINIMAL
                    )
                    writer.writerow(header)
                    writer.writerows(rows)

        case 'experiment':
            not_circuit(args.qubits, args.samples, args.plot, args.noisy == 1, args.verbose)
        case _:
            raise Exception(f'Invalid command: {args.command}')


if __name__ == '__main__':
    main()
