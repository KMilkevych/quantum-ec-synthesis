from pathlib import Path

from qiskit import qasm3
from qiskit.circuit import (
    ClassicalRegister,
    QuantumCircuit,
    QuantumRegister
)

from config import CIRCUIT_KINDS

def generate(
    verbose: int,
    kind: str,
    qubits: int,
    output_file: str
):

    # Decide which circuits to generate
    kinds = None
    if kind is not None and kind != 'all':
        kinds = [kind]
    else:
        kinds = CIRCUIT_KINDS

    for kind in kinds:

        # Skip helper-element
        if kind == 'all':
            continue

        qc = QuantumCircuit(
            q_reg := QuantumRegister(qubits, 'q_dat'),
            c_reg := ClassicalRegister(qubits, 'c_dat')
        )

        match(kind):

            case 'identity':
                pass
            case 'x':
                for i in range(qubits):
                    qc.x(i)
            case 'h':
                for i in range(qubits):
                    qc.h(i)
            case 'snake':
                for i in range(qubits):

                    # Length-10 x-snake
                    for _ in range(5):
                        qc.x(i)
                        qc.x(i)
            case _:
                raise Exception(f'Unrecognized circuit kind: {kind}')

        # Add measurements
        qc.measure(q_reg, c_reg)

        if verbose == 1:
            print(f"GENERATED {kind}-circuit:")
            print(qc)

        # Dump circuit to file
        if output_file is not None:

            if len(kinds) > 1:
                ouf = Path(f"{output_file}/{kind}-{qubits}.qasm")
            else:
                ouf = Path(f"{output_file}")

            ouf.parent.mkdir(parents=True, exist_ok=True)

            with open(ouf, 'w') as f:
                qasm3.dump(qc, f)

    return
