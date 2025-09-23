from abc import ABC, abstractmethod
from qiskit import (QuantumCircuit,
                    QuantumRegister,
                    AncillaRegister,
                    ClassicalRegister)


class Synthesizer(ABC):

    @abstractmethod
    def synthesize(self, circuit: QuantumCircuit) -> QuantumCircuit:
        pass


class ShorSynthesizer(Synthesizer):
    '''Error-correcting code synthesizer for the 9-qubit Shor-code'''

    def __init__(self):
        pass

    def synthesize(self, circuit: QuantumCircuit) -> QuantumCircuit:
        # TODO: Explore idea of using one register / logical qubit

        # TODO: Allow handling circuits with multiple quantum,
        # classical, as well as ancilla qubit registers
        n_qubits = circuit.num_qubits

        # Initialize target circuit
        q_data = QuantumRegister(n_qubits * 9, 'q_data')
        q_anc = AncillaRegister(2, 'q_anc')
        c_data = ClassicalRegister(n_qubits, 'c_data')
        c_anc = ClassicalRegister(2, 'c_anc')

        qc = QuantumCircuit(q_data, q_anc, c_data, c_anc)

        # TODO: Initialize qubits properly
        initial_state = 0
        qc.initialize(
            initial_state,
            qubits=[q_data[i * 9] for i in range(n_qubits)],
            normalize=False
        )

        # Initialize ancilla qubits
        qc.initialize(0, q_anc)

        # Synthesize each gate
        for ins in circuit.data:
            match (ins.name):
                case 'h':
                    for i in range(9):
                        qc.h(ins.qubits[0]._index*9 + i)
                case 'x':
                    for i in range(9):
                        qc.x(ins.qubits[0]._index*9 + i)
                case 's':
                    for i in range(9):
                        qc.s(ins.qubits[0]._index*9 + i)
                case 'cx':
                    for i in range(9):
                        qc.cx(ins.qubits[0]._index*9 + i, ins.qubits[1]._index*9 + i)
                case _:
                    raise Exception(f'Non-clifford instruction: {ins}')

            # Add barrier
            qc.barrier()

        return qc
