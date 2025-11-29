from pathlib import Path

from qiskit import qasm3, qasm2
from qiskit.circuit import ClassicalRegister, QuantumCircuit, QuantumRegister
from qiskit.circuit.random import random_clifford_circuit

from config import CIRCUIT_KINDS


def generate(verbose: int, kind: str, qubits: int, gate_count: int, output_file: str, use_qasm2=False):

    # Decide which circuits to generate
    kinds = None
    if kind is not None and kind != "all":
        kinds = [kind]
    else:
        kinds = CIRCUIT_KINDS

    for kind in kinds:

        # Skip helper-element
        if kind == "all":
            continue

        qc = QuantumCircuit(
            q_reg := QuantumRegister(qubits, "q_dat"),
            c_reg := ClassicalRegister(qubits, "c_dat"),
        )

        match (kind):

            case "identity":
                pass
            case "x":
                for i in range(qubits):
                    qc.x(i)
            case "h":
                for i in range(qubits):
                    qc.h(i)
            case "snake":
                for i in range(qubits):
                    for _ in range(gate_count//2):
                        qc.x(i)
                        qc.x(i)
            case "entangle":
                qc.h(0)
                for i in range(1, qubits):
                    qc.cx(0, i)
            case "random-clifford":
                _qc = random_clifford_circuit(
                    num_qubits=qubits,
                    num_gates=gate_count,
                    gates=['s', 'h', 'z', 'x'] + (['cx'] if qubits >= 2 else [])
                )
                qc.compose(_qc, inplace=True)
            case _:
                raise Exception(f"Unrecognized circuit kind: {kind}")

        # Add measurements
        # qc.measure(q_reg, c_reg)
        qc.measure(qc.qubits, qc.clbits)

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

            with open(ouf, "w") as f:
                if use_qasm2:
                    qasm2.dump(qc, f)
                else:
                    qasm3.dump(qc, f)

    return
