#!/usr/bin/env python3
import argparse
from experiment import not_circuit

def main():

    # Describe main parser
    parser = argparse.ArgumentParser(
        description='Quantum Layout Synthesis for Fault-Tolerant computation.',
        formatter_class=argparse.ArgumentDefaultsHelpFormatter
    )

    # Global parser arguments
    parser.add_argument('-v', '--verbose', help="turn on verbose output", choices=(0,1), default=1)
    parser.add_argument(
        'command',
        help="method to run",
        type=str,
        choices=('experiment',)
    )

    # Arguments for experiments
    parser.add_argument(
        '-q',
        '--qubits',
        help="circuit size (no. logical qubits)",
        type=int,
        default=1
    )
    parser.add_argument(
        '--noisy',
        help="enable noise simulation",
        type=int,
        choices=(0, 1),
        default=0
    )
    parser.add_argument(
        '-s',
        '--samples',
        help="no. of samples/simulations",
        type=int,
        default=1000
    )
    parser.add_argument(
        '--plot',
        help="directory to store result visualisation",
        type=str,
    )

    # Parse arguments and run desired functionality
    args = parser.parse_args()
    match (args.command):
        case 'experiment':
            not_circuit(args.qubits, args.samples, args.plot, args.noisy == 1, args.verbose)
        case _:
            raise Exception(f'Invalid command: {args.command}')


if __name__ == '__main__':
    main()
