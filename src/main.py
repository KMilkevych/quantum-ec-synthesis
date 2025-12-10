#!/usr/bin/env python3
import argparse
from config import SYNTHESIZE_METHODS, CIRCUIT_KINDS, NOISE_KINDS, EXPERIMENT_KINDS, OPTIMIZERS

from experiment import (
    circuit_depth,
    error_rate,
    correction_frequency,
    gate_count_hd,
    error_rate_hd
)

from simulate import simulate
from generate import generate
from synthesize import synthesize


def main():

    # Describe main parser
    parser = argparse.ArgumentParser(
        description="Quantum Error-Correction Code Synthesis for Fault-Tolerant computation.",
        formatter_class=argparse.ArgumentDefaultsHelpFormatter,
    )

    # Add sub-parsers
    subparsers = parser.add_subparsers(help="Commands", dest="command")
    synthesize_parser = subparsers.add_parser(
        "synthesize",
        description="Perform synthesis of Quantum Error-Correcting Codes onto existing circuits.",
        formatter_class=argparse.ArgumentDefaultsHelpFormatter,
    )
    simulate_parser = subparsers.add_parser(
        "simulate",
        description="Perform exact and noisy simulations of existing circuits.",
        formatter_class=argparse.ArgumentDefaultsHelpFormatter,
    )
    generate_parser = subparsers.add_parser(
        "generate",
        description="Generate example quantum circuits.",
        formatter_class=argparse.ArgumentDefaultsHelpFormatter,
    )
    experiment_parser = subparsers.add_parser(
        "experiment",
        description="Perform experiments.",
        formatter_class=argparse.ArgumentDefaultsHelpFormatter,
    )
    other_parser = subparsers.add_parser(
        "other",
        description="Other stuff",
        formatter_class=argparse.ArgumentDefaultsHelpFormatter,
    )

    # Global parser arguments
    parser.add_argument(
        "-v", "--verbose", help="turn on verbose output", type=int, choices=(0, 1), default=1
    )

    # Synthesize parser arguments
    synthesize_parser.add_argument(
        "input_circuit",
        help=".qasm file containing input circuit",
        type=str,
    )
    synthesize_parser.add_argument(
        "-m",
        "--method",
        help="synthesis method",
        type=str,
        choices=SYNTHESIZE_METHODS,
        default=SYNTHESIZE_METHODS[0],
    )
    synthesize_parser.add_argument(
        "-ecf",
        "--error-correction-frequency",
        help="Frequency of error-correction insertion. 0=only before each measurement.",
        type=int,
        default=1,
    )
    synthesize_parser.add_argument(
        "-o",
        "--output",
        help=".qasm file for storing output circuit",
        type=str,
        default=None,
    )
    synthesize_parser.add_argument(
        "-opt",
        "--optimize",
        help="optimize error-correcting machinery",
        type=str,
        choices=OPTIMIZERS,
    )

    # Simulate parser arguments
    simulate_parser.add_argument(
        "input_circuit",
        nargs="+",
        help=".qasm file(s) containing input circuit(s)",
        type=str,
    )
    simulate_parser.add_argument(
        "-s", "--samples", help="no. of samples/simulations", type=int, default=1000
    )
    simulate_parser.add_argument(
        "-nt",
        "--noise-type",
        help="type of noise model to simulate with",
        type=str,
        default=None,
        choices=NOISE_KINDS
    )
    simulate_parser.add_argument(
        "-na",
        "--noise-amplitude",
        help="probability of basic error in noise model",
        type=float,
        default=0.01
    )
    simulate_parser.add_argument(
        "--plot",
        help=".png file to plot simulation measurements",
        type=str,
        default=None,
    )
    simulate_parser.add_argument(
        "--csv",
        help=".csv file to store simulation measurements",
        type=str,
        default=None,
    )

    # Generate parser arguments
    generate_parser.add_argument(
        "-k",
        "--kind",
        help="circuit to generate",
        type=str,
        choices=CIRCUIT_KINDS,
        default=CIRCUIT_KINDS[0],
    )
    generate_parser.add_argument(
        "-q", "--qubits", help="circuit size (no. logical qubits)", type=int, default=1
    )
    generate_parser.add_argument(
        "-gc",
        "--gate-count",
        help="circuit size (no. logical gates)",
        type=int,
        default=32
    )
    generate_parser.add_argument(
        "-f",
        "--format",
        help="circuit size (no. logical gates)",
        type=str,
        choices=["qasm2", "qasm3"],
        default="qasm3"
    )
    generate_parser.add_argument(
        "-o",
        "--output",
        help="output file/directory for storing output circuits",
        type=str,
        default=None,
    )

    # Experiment parser arguments
    experiment_parser.add_argument(
        "experiment",
        help="Which experiment to perform",
        type=str,
        choices=EXPERIMENT_KINDS
    )
    experiment_parser.add_argument(
        "-p",
        "--p-error",
        help="Probability of error",
        type=float,
        default=0.01
    )
    experiment_parser.add_argument(
        "-ec",
        "--error-correct",
        help="How often to perform error-correction",
        type=int,
        default=30
    )
    experiment_parser.add_argument(
        "-d",
        "--circuit_depth",
        help="How deep a circuit to generate",
        type=int,
        default=1024
    )
    experiment_parser.add_argument(
        "-s",
        "--samples",
        help="How many samples to measure",
        type=int,
        default=1000
    )
    experiment_parser.add_argument(
        "-m",
        "--method",
        help="synthesis method",
        type=str,
        choices=SYNTHESIZE_METHODS,
        default=SYNTHESIZE_METHODS[0],
    )

    # Parse arguments and run desired functionality
    args = parser.parse_args()
    match (args.command):

        case None:
            print(parser.format_help())

        case "synthesize":
            synthesize(
                verbose=args.verbose,
                input_circuit=args.input_circuit,
                method=args.method,
                optimizer=args.optimize,
                ec_frequency=args.error_correction_frequency,
                output_file=args.output
            )

        case "generate":
            generate(
                verbose=args.verbose,
                kind=args.kind,
                qubits=args.qubits,
                gate_count=args.gate_count,
                output_file=args.output,
                use_qasm2=args.format=='qasm2'
            )

        case "simulate":
            simulate(
                args.verbose,
                args.input_circuit,
                args.samples,
                args.noise_type,
                args.noise_amplitude,
                args.plot,
                args.csv,
            )

        case "experiment":

            match (args.experiment):
                case "circuit-depth":
                    circuit_depth(
                        samples=args.samples,
                        p_error=args.p_error,
                        error_correct=args.error_correct,
                        method=args.method,
                    )
                case "error-rate":
                    error_rate(
                        samples=args.samples,
                        circuit_depth=args.circuit_depth,
                        error_correct=args.error_correct,
                        method=args.method,
                    )
                case "correction-frequency":
                    correction_frequency(
                        samples=args.samples,
                        p_error=args.p_error,
                        circuit_depth=args.circuit_depth,
                        method=args.method,
                    )
                case "clifford-gate-count":
                    gate_count_hd(
                        error_correct=args.error_correct,
                        samples=args.samples,
                        p_error=args.p_error,
                        method=args.method,
                    )
                case "clifford-error-rate":
                    error_rate_hd(
                        error_correct=args.error_correct,
                        samples=args.samples,
                        gate_count=args.circuit_depth,
                        method=args.method,
                    )

                case _:
                    raise Exception(f"Invalid experiment kind: {args.experiment}")

        case "other":

            # Do other stuff..
            import qiskit
            from qiskit import qasm3
            from qiskit.transpiler import PassManager
            from qiskit.transpiler.passes import OptimizeCliffords

            FOLDER = "benchmark-circuits-10q"
            qc_128 = qasm3.load(f"{FOLDER}/clifford-10-128.qasm")
            qc_256 = qasm3.load(f"{FOLDER}/clifford-10-256.qasm")
            qc_512 = qasm3.load(f"{FOLDER}/clifford-10-512.qasm")
            qc_1024 = qasm3.load(f"{FOLDER}/clifford-10-1024.qasm")

            # Optimize these circuits
            from qiskit.transpiler.preset_passmanagers import generate_preset_pass_manager
            opt_pass = generate_preset_pass_manager(
                optimization_level=3,
                basis_gates = ["cx", "x", "h", "s", "z", "measure"]
            )

            print("CIRCUIT 128")
            try:
                qc_128_opt = opt_pass.run(qc_128)
                print(qc_128_opt)
                with open(f"{FOLDER}/clifford-10-128-opt.qasm", "w") as f:
                    qasm3.dump(qc_128_opt, f)
            except:
                pass

            print("CIRCUIT 256")
            try:
                qc_256_opt = opt_pass.run(qc_256)
                print(qc_256_opt)
                with open(f"{FOLDER}/clifford-10-256-opt.qasm", "w") as f:
                    qasm3.dump(qc_256_opt, f)
            except:
                pass

            print("CIRCUIT 512")
            try:
                qc_512_opt = opt_pass.run(qc_512)
                print(qc_512_opt)
                with open(f"{FOLDER}/clifford-10-512-opt.qasm", "w") as f:
                    qasm3.dump(qc_512_opt, f)
            except:
                pass

            print("CIRCUIT 1024")
            try:
                qc_1024_opt = opt_pass.run(qc_1024)
                print(qc_1024_opt)
                with open(f"{FOLDER}/clifford-10-1024-opt.qasm", "w") as f:
                    qasm3.dump(qc_1024_opt, f)
            except:
                pass

            pass

        case _:
            raise Exception(f"Invalid command: {args.command}")


if __name__ == "__main__":
    main()
