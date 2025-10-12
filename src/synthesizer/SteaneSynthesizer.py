from typing import Optional
from collections import defaultdict

from synthesizer.Synthesizer import Synthesizer
from synthesizer.BarrierTypes import BarrierType

from qiskit import (
    QuantumCircuit,
    QuantumRegister,
    AncillaRegister,
    ClassicalRegister
)
from qiskit.circuit.library import (
    ZGate,
    SGate
)
from qiskit._accelerate.circuit import CircuitInstruction

class SteaneSynthesizer(Synthesizer):
    '''
    Error-correcting code synthesizer for the 7-qubit Steane-code
    https://stem.mitre.org/quantum/error-correction-codes/steane-ecc.html
    '''

    def __init__(
            self,
            barrier_labels: Optional[bool] = True,
            ec_every_x_gates: int = 1,
            parallel_ec: bool = False
    ):

        # Initialize barrier labels
        if barrier_labels is True:
            self.barrier_labels = {
                BarrierType.ENCODE : 'ENCODE',
                BarrierType.DECODE : 'DECODE',
                BarrierType.LOGICAL_GATE : 'LOGICAL-GATE',
                BarrierType.ERROR_CORRECT : 'ERROR-CORRECTION',
                BarrierType.MEASURE : 'MEASURE',
                BarrierType.SOURCE : 'SOURCE',
                BarrierType.OTHER : None
            }
        else:
            self.barrier_labels = defaultdict(None)

        # Initialize other options
        self.ec_every_x_gates = ec_every_x_gates
        self.parallel_ec = parallel_ec

    def _encode_logical_qubit(
            self,
            circuit: QuantumCircuit,
            register: QuantumRegister
    ):

        # Encodes logical qubit
        circuit.cx(register[0], register[1])
        circuit.cx(register[0], register[2])
        circuit.h(register[4])
        circuit.h(register[5])
        circuit.h(register[6])
        circuit.cx(register[6], register[0])
        circuit.cx(register[6], register[1])
        circuit.cx(register[6], register[3])
        circuit.cx(register[5], register[0])
        circuit.cx(register[5], register[2])
        circuit.cx(register[5], register[3])
        circuit.cx(register[4], register[1])
        circuit.cx(register[4], register[2])
        circuit.cx(register[4], register[3])

        return

    def _decode_logical_qubit(
            self,
            circuit: QuantumCircuit,
            register: QuantumRegister
    ):

        # Decodes logical qubit (reverse of encode)
        circuit.cx(register[4], register[3])
        circuit.cx(register[4], register[2])
        circuit.cx(register[4], register[1])
        circuit.cx(register[5], register[3])
        circuit.cx(register[5], register[2])
        circuit.cx(register[5], register[0])
        circuit.cx(register[6], register[3])
        circuit.cx(register[6], register[1])
        circuit.cx(register[6], register[0])
        circuit.h(register[6])
        circuit.h(register[5])
        circuit.h(register[4])
        circuit.cx(register[0], register[2])
        circuit.cx(register[0], register[1])

        return

    def _encode_gate_transversal(
            self,
            circuit: QuantumCircuit,
            gate: CircuitInstruction
    ):

        # Apply operation to all physical qubits
        for i in range(7):
            circuit.append(
                gate.operation,
                list(map(lambda x: x._index * 7 + i, gate.qubits))
            )

        return

    def _encode_measurement(
            self,
            circuit: QuantumCircuit,
            measurement: CircuitInstruction
    ):
        # Measure first qubit from corresponding logical register
        circuit.append(
            measurement.operation,
            list(map(lambda q: circuit.qregs[q._index][0], measurement.qubits)),
            list(map(lambda c: circuit.clbits[c._index], measurement.clbits))
        )
        return

    def _encode_error_correction(
            self,
            circuit: QuantumCircuit,
            q_register: QuantumRegister,
            a_register: AncillaRegister,
            c_register: ClassicalRegister
    ):

        # Perform measurement of syndromes
       stabilizers = [
            '0001111',
            '0110011',
            '1010101'
        ]

       # First measure bit-flip syndromes
       for i, syndrome in enumerate(stabilizers):
           syndrome = map(int, syndrome)

           # Parse syndrome
           for j, c in enumerate(syndrome):
               if c == 0: continue
               circuit.cx(q_register[j], a_register[i])

       circuit.barrier()
       circuit.measure(a_register, c_register)
       circuit.barrier()

       # Perform bit-flip corrections
       for x in range(7):
           with circuit.if_test((c_register, x+1)):
               circuit.x(q_register[x])

       circuit.barrier()

       # Reset ancillaries
       circuit.reset(a_register)
       circuit.barrier(a_register)

       # Measure phase-flip syndromes
       for i, syndrome in enumerate(stabilizers):
           syndrome = map(int, syndrome)
           circuit.h(a_register[i])

           # Parse syndrome
           for j, c in enumerate(syndrome):
               if c == 0: continue
               circuit.cx(q_register[j], a_register[i])

           circuit.h(a_register[i])

       circuit.barrier()
       circuit.measure(a_register, c_register)
       circuit.barrier()

       # Perform phase-flip corrections
       for x in range(7):
           with circuit.if_test((c_register, x+1)):
               circuit.z(q_register[x])

       circuit.barrier()

       # Reset ancillaries
       circuit.reset(a_register)
       circuit.barrier(a_register)

       return


    def synthesize(self, circuit: QuantumCircuit) -> QuantumCircuit:

        # Resulting circuit
        qc = QuantumCircuit()

        # Encode logical qubits of source circuit as quantum registers
        for log in range(circuit.num_qubits):
            qc.add_register(QuantumRegister(7, f'q_log{log}'))

        # Add ancillary and classical registers for computation
        q_ancs = list()
        if self.parallel_ec:
            for i in range(circuit.num_qubits):
                qc.add_register(q_anc := AncillaRegister(3, f"q_anc{i}"))
                q_ancs.append(q_anc)
        else:
            qc.add_register(q_anc := AncillaRegister(3, "q_anc"))
            q_ancs = [q_anc for _ in range(circuit.num_qubits)]

        # Add classical registers for measurements
        # BUG: Causes issues in line 227 with c_anc already being in use...
        # Need name mangling for existing registers
        for creg in circuit.cregs:
            qc.add_register(creg)

        # Add classical registers for ancillary measurements
        c_ancs = list()
        if self.parallel_ec:
            for i in range(circuit.num_qubits):
                qc.add_register(c_anc := ClassicalRegister(3, f"c_anc{i}"))
                c_ancs.append(c_anc)
        else:
            qc.add_register(c_anc := ClassicalRegister(3, "c_anc"))
            c_ancs = [c_anc for _ in range(circuit.num_qubits)]


        # Encode all logical qubits with error-correction
        for log in range(circuit.num_qubits):
            self._encode_logical_qubit(qc, qc.qregs[log])

        # NOTE: Adding a barrier for readability
        qc.barrier(label=self.barrier_labels[BarrierType.ENCODE])

        # Encode all gates
        for ins_no, ins in enumerate(circuit.data):

            # Encode supported gates
            match(ins.name):


                # CX gates can be encoded transversally
                case 'x' | 'z' | 'h' | 'cx':
                    self._encode_gate_transversal(qc, ins)

                # S gates are encoded transversally as ZS gates
                case 's':
                    self._encode_gate_transversal(
                        qc,
                        CircuitInstruction(operation=SGate(), qubits=ins.qubits)
                    )
                    self._encode_gate_transversal(
                        qc,
                        CircuitInstruction(operation=ZGate(), qubits=ins.qubits)
                    )

                # Measurements should be respected
                case 'measure':
                    for qb in ins.qubits:
                        self._decode_logical_qubit(qc, qc.qregs[qb._index])
                    qc.barrier(label=self.barrier_labels[BarrierType.DECODE])
                    self._encode_measurement(qc, ins)
                    qc.barrier(label=self.barrier_labels[BarrierType.MEASURE])

                    # NOTE: continue to avoid double-barrier
                    continue

                # Add barrier
                case 'barrier':

                    barrier_label = None \
                        if (il := ins.operation.label is None) \
                           else il if (ol := self.barrier_labels[BarrierType.SOURCE] is None)\
                                else f"{ol}-{il}"

                    # if \
                    #    (il := ins.operation.label is not None):
                    #     if (ol := self.barrier_labels[BarrierType.SOURCE] is not None):
                    #         barrier_label = f"{ol}-{il}"
                    #     else:
                    #         barrier_label = il
                    # else:
                    #     barrier_label = None

                    # Add barrier to affected qubits
                    qc.barrier(
                        list(map(lambda x: qc.qregs[x], ins.qubits)),
                        label=barrier_label
                    )

                # Other gates are currently unsupported
                case _:
                    raise Exception(f'Unsupported instruction: {ins.name}')

            # NOTE: Inserting barrier for readability
            qc.barrier(label=self.barrier_labels[BarrierType.LOGICAL_GATE])

            # Encode error-correction on all affected qubits
            if ins_no % self.ec_every_x_gates == 0:
                for qb in ins.qubits:
                    self._encode_error_correction(
                        qc,
                        qc.qregs[qb._index],
                        q_ancs[qb._index],
                        c_ancs[qb._index]
                    )

                qc.barrier(label=self.barrier_labels[BarrierType.ERROR_CORRECT])


        # Return measured circuit
        return qc
