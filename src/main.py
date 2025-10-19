#!/usr/bin/env python3
import argparse
from config import (
    SYNTHESIZE_METHODS,
    CIRCUIT_KINDS
)

from experiment import not_circuit

from simulate import simulate
from generate import generate
from synthesize import synthesize

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
            synthesize(
                args.verbose,
                args.input_circuit,
                args.method,
                args.output
            )

        case 'generate':
            generate(
                args.verbose,
                args.kind,
                args.qubits,
                args.output
            )

        case 'simulate':
            simulate(
                args.verbose,
                args.input_circuit,
                args.noisy,
                args.samples,
                args.plot,
                args.csv
            )

        case 'experiment':
            not_circuit(args.qubits, args.samples, args.plot, args.noisy == 1, args.verbose)
        case _:
            raise Exception(f'Invalid command: {args.command}')


if __name__ == '__main__':
    main()
