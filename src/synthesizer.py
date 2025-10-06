from abc import ABC, abstractmethod
from qiskit import (
    QuantumCircuit,
    QuantumRegister,
    AncillaRegister,
    ClassicalRegister
)
from qiskit.circuit import (
    CircuitInstruction,
    # Instruction,
    # AncillaQubit
)


class Synthesizer(ABC):

    # TODO:
    # Add Pauli-string initialization of stabilizer codes

    @abstractmethod
    def synthesize(self, circuit: QuantumCircuit) -> QuantumCircuit:
        pass


class ShorSynthesizer(Synthesizer):
    '''Error-correcting code synthesizer for the 9-qubit Shor-code'''

    def __init__(self, parallel_ec: bool = False):
        self.parallel_ec = parallel_ec

    def _encode_logical_qubit(
            self,
            circuit: QuantumCircuit,
            register: QuantumRegister
    ):

        # Encode outer-layer of bit-flip protection
        for i in range(1, 3):
            circuit.cx(register[0], register[i * 3])

        # Encode inner-layer of phase-flip protection
        for i in range(3):

            circuit.h(register[3*i])
            for j in range(1, 3):
                circuit.cx(register[3*i], register[3*i + j])

        return

    def _encode_gate_transversal(
            self,
            circuit: QuantumCircuit,
            gate: CircuitInstruction
    ):

        # Apply operation to all encoded qubits
        for i in range(9):
            circuit.append(
                gate.operation,
                map(lambda x: x._index * 9 + i, gate.qubits)
            )

        return

    def _encode_measurement(
            self,
            circuit: QuantumCircuit,
            measurement: CircuitInstruction
    ):
        # Measure from the logical register
        circuit.append(
            measurement.operation,
            map(lambda q: circuit.qregs[q._index][0], measurement.qubits),
            map(lambda c: circuit.clbits[c._index], measurement.clbits)
        )
        return

    def _encode_error_correction(
            self,
            circuit: QuantumCircuit,
            q_register: QuantumRegister,
            a_register: AncillaRegister,
            c_register: ClassicalRegister
    ):

        # Correct bit-flips in each block
        for b in range(3):

            # Parity-checks (syndromes)
            circuit.cx(q_register[b * 3 + 0], a_register[0])
            circuit.cx(q_register[b * 3 + 1], a_register[0])
            circuit.cx(q_register[b * 3 + 1], a_register[1])
            circuit.cx(q_register[b * 3 + 2], a_register[1])

            circuit.barrier(a_register)

            # Measure syndromes
            circuit.measure(a_register, c_register)

            # Reset ancillary qubits
            circuit.barrier(a_register)
            circuit.reset(a_register)
            circuit.barrier()

            # TODO: Reset ancillary qubits to zero state
            # with circuit.if_test((c_register[0], 1)):
            #     circuit.x(a_register[0])
            # with circuit.if_test((c_register[1], 1)):
            #     circuit.x(a_register[1])

            # Perform error-correction based on syndromes
            with circuit.if_test((c_register, 1)):
                # Error on 3rd qubit
                circuit.x(q_register[b * 3 + 2])

            with circuit.if_test((c_register, 2)):
                # Error on 1st qubit
                circuit.x(q_register[b * 3])

            with circuit.if_test((c_register, 3)):
                # Error on 2nd qubit
                circuit.x(q_register[b * 3 + 1])

            circuit.barrier()

        # Measure syndromes for phase-flips
        circuit.h(a_register)
        circuit.barrier(a_register)
        circuit.cx(
            a_register[0],
            (q_register[i] for i in range(6))
        )
        circuit.barrier(a_register)
        circuit.cx(
            a_register[1],
            (q_register[i] for i in range(3, 9))
        )

        circuit.barrier(a_register)
        circuit.h(a_register)
        circuit.barrier(a_register)

        # Measure syndromes
        circuit.measure(a_register, c_register)

        # Reset ancillary qubits
        circuit.barrier(a_register)
        circuit.reset(a_register)
        circuit.barrier()

        # Apply error-correction
        with circuit.if_test((c_register, 1)):
            # 1st and 2nd parity equal
            # 2nd and 3rd parity differ
            circuit.z(q_register[0])
        with circuit.if_test((c_register, 2)):
            # 1st and 2nd parity differ
            # 2nd and 3rd parity equal
            circuit.z(q_register[3])
        with circuit.if_test((c_register, 3)):
            # 1st and 2nd parity differ
            # 2nd and 3rd parity differ
            circuit.z(q_register[6])

        return

    def synthesize(self, circuit: QuantumCircuit) -> QuantumCircuit:

        # Resulting circuit
        qc = QuantumCircuit()

        # Encode logical qubits of source circuit as quantum registers
        for log in range(circuit.num_qubits):
            qc.add_register(QuantumRegister(9, f'q_log{log}'))

        # Add ancillary and classical registers for computation
        q_ancs = list()
        if self.parallel_ec:
            for i in range(circuit.num_qubits):
                qc.add_register(q_anc := AncillaRegister(2, f"q_anc{i}"))
                q_ancs.append(q_anc)
        else:
            qc.add_register(q_anc := AncillaRegister(2, "q_anc"))
            q_ancs = [q_anc for _ in range(circuit.num_qubits)]

        # Add classical registers for measurements
        for creg in circuit.cregs:
            qc.add_register(creg)

        # Add classical registers for ancillary measurements
        c_ancs = list()
        if self.parallel_ec:
            for i in range(circuit.num_qubits):
                qc.add_register(c_anc := ClassicalRegister(2, f"c_anc{i}"))
                c_ancs.append(c_anc)
        else:
            qc.add_register(c_anc := ClassicalRegister(2, "c_anc"))
            c_ancs = [c_anc for _ in range(circuit.num_qubits)]

        # Encode all logical qubits
        for log in range(circuit.num_qubits):
            self._encode_logical_qubit(qc, qc.qregs[log])

        # NOTE: Adding a barrier for readability
        qc.barrier()

        # Encode all gates
        for ins in circuit.data:

            # Encode supported gates
            match(ins.name):

                # Clifford-Gates can be encoded transversally in Shor-code
                case 'x' | 'h' | 's' | 'cx':
                    self._encode_gate_transversal(qc, ins)

                # Measurements should be respected
                case 'measure':
                    self._encode_measurement(qc, ins)
                    qc.barrier()

                    # NOTE: continue to avoid double-barrier
                    continue

                # Barriers are just ignored, as they are added anyway
                case 'barrier':
                    pass

                # Other gates are currently unsupported
                case _:
                    raise Exception(f'Unsupported instruction: {ins}')

            # NOTE: Adding a barrier for readability
            qc.barrier()

            # Encode error-correction on all affected qubits
            for qb in ins.qubits:
                self._encode_error_correction(
                    qc,
                    qc.qregs[qb._index],
                    q_ancs[qb._index],
                    c_ancs[qb._index]
                )

            # NOTE: Adding a barrier for readability
            qc.barrier()


        # Return measured circuit
        return qc
