from typing import Optional, Iterable
from collections import defaultdict

from qiskit.circuit.gate import Instruction
from qiskit.circuit.quantumcircuit import QubitSpecifier

from synthesizer.Synthesizer import Synthesizer
from synthesizer.BarrierTypes import BarrierType

from qiskit import QuantumCircuit, QuantumRegister, AncillaRegister, ClassicalRegister
from qiskit.circuit.library import ZGate, SGate
from qiskit._accelerate.circuit import CircuitInstruction


class BitFlipSynthesizer(Synthesizer):
    """
    Error-correcting code synthesizer for the 7-qubit Steane-code
    https://stem.mitre.org/quantum/error-correction-codes/steane-ecc.html
    """

    def __init__(
        self,
        barrier_labels: Optional[bool] = True,
        ec_every_x_gates: int = 1,
        parallel_ec: bool = False,
        register_name_prefix: str = "src_",
    ):

        # Initialize barrier labels
        if barrier_labels is True:
            self.barrier_labels = {
                BarrierType.ENCODE: "ENCODE",
                BarrierType.DECODE: "DECODE",
                BarrierType.LOGICAL_GATE: "LOGICAL-GATE",
                BarrierType.ERROR_CORRECT: "ERROR-CORRECTION",
                BarrierType.MEASURE: "MEASURE",
                BarrierType.SOURCE: "SOURCE",
                BarrierType.OTHER: None,
            }
        else:
            self.barrier_labels = defaultdict(None)

        # Initialize other options
        self.ec_every_x_gates = ec_every_x_gates
        self.parallel_ec = parallel_ec

        # Set name prefix
        self.register_name_prefix = register_name_prefix

    def _encode_logical_qubit(self, circuit: QuantumCircuit, register: QuantumRegister):

        # Encodes logical qubit
        circuit.cx(register[0], register[1])
        circuit.cx(register[0], register[2])

        return

    def _decode_logical_qubit(self, circuit: QuantumCircuit, register: QuantumRegister):

        # Decodes logical qubit (reverse of encode)
        circuit.cx(register[0], register[2])
        circuit.cx(register[0], register[1])

        return

    def _encode_gate_transversal(
        self, circuit: QuantumCircuit, gate: Instruction, logical_qubits: list[int]
    ):

        # Apply operation to all physical qubits
        for i in range(3):
            circuit.append(
                gate,
                list(map(lambda idx: idx * 3 + i, logical_qubits))
            )

        return

    def _encode_measurement(
        self,
        circuit: QuantumCircuit,
        measurement: CircuitInstruction,
        logical_qubits: list[int],
        logical_clbits: list[int]
    ):
        # Measure first qubit from corresponding logical register
        # NOTE: Might be issues with name mangling and register naming
        circuit.append(
            measurement.operation,
            list(map(lambda q: circuit.qregs[q][0], logical_qubits)),
            list(map(lambda c: circuit.clbits[c], logical_clbits)),
        )
        return

    def _encode_error_correction(
        self,
        circuit: QuantumCircuit,
        q_register: QuantumRegister,
        a_register: AncillaRegister,
        c_register: ClassicalRegister,
    ):

        # Measure syndromes
        circuit.cx(q_register[0], a_register[0])
        circuit.cx(q_register[1], a_register[0])
        circuit.cx(q_register[1], a_register[1])
        circuit.cx(q_register[2], a_register[1])

        circuit.barrier()
        circuit.measure(a_register, c_register)
        circuit.barrier()

        # Perform error-corrections
        with circuit.if_test((c_register, 1)):
            circuit.x(q_register[2])
        with circuit.if_test((c_register, 2)):
            circuit.x(q_register[0])
        with circuit.if_test((c_register, 3)):
            circuit.x(q_register[1])

        circuit.barrier()

        # Reset ancillaries
        circuit.reset(a_register)
        circuit.barrier(a_register)

        return

    def _encode_logical_gate(
            self,
            circuit: QuantumCircuit,
            gate: CircuitInstruction,
            logical_qubits: list[int],
            logical_clbits: list[int]
    ):

        # Encode supported gates
        match (gate.name):

            # Most gates can be encoded transversally
            case "x" | "z" | "h" | "s" | "cx":
                self._encode_gate_transversal(
                    circuit, gate.operation, logical_qubits
                )

            # Measurements should be respected
            case "measure":
                for qb in logical_qubits:
                    self._decode_logical_qubit(circuit, circuit.qregs[qb])

                circuit.barrier(label=self.barrier_labels[BarrierType.DECODE])
                self._encode_measurement(
                    circuit,
                    gate,
                    logical_qubits,
                    logical_clbits
                )
                circuit.barrier(label=self.barrier_labels[BarrierType.MEASURE])

            # Resets are implemented as reset and re-encode on physical qubits
            case "reset":

                # Reset physical qubits
                for logical_qubit in logical_qubits:
                    circuit.reset([logical_qubit * 3 + i for i in range(3)])

                # Re-encode logical qubit
                for logical_qubit in logical_qubits:
                    self._encode_logical_qubit(circuit, circuit.qregs[logical_qubit])

            # Add barrier
            case "barrier":

                barrier_label = (
                    None
                    if (il := gate.operation.label is None)
                    else (
                        il
                        if (ol := self.barrier_labels[BarrierType.SOURCE] is None)
                        else f"{ol}-{il}"
                    )
                )

                qubit_indices = list(
                    set.union(
                        *list(
                            map(lambda x: set(circuit.qregs[x]), logical_qubits)
                        )
                    )
                )

                circuit.barrier(qubit_indices, label=barrier_label)

            # Other gates are currently unsupported
            case _:
                raise Exception(f"Unsupported gatetruction: {gate.name}")

        return

    def synthesize(
        self, circuit: QuantumCircuit, data_register: Optional[str] = "c_dat"
    ) -> QuantumCircuit:

        # Resulting circuit
        qc = QuantumCircuit()

        # Encode logical qubits of source circuit as quantum registers
        for log in range(circuit.num_qubits):
            qc.add_register(QuantumRegister(3, f"q_log{log}"))

        # Add ancillary and classical registers for computation
        q_ancs = list()
        if self.parallel_ec:
            for i in range(circuit.num_qubits):
                qc.add_register(q_anc := AncillaRegister(2, f"q_anc{i}"))
                q_ancs.append(q_anc)
        else:
            qc.add_register(q_anc := AncillaRegister(2, "q_anc"))
            q_ancs = [q_anc for _ in range(circuit.num_qubits)]

        # Add classical registers with name-mangling
        for creg in circuit.cregs:
            reg_name = creg.name
            if creg.name.startswith("c_anc"):
                reg_name = f"{self.register_name_prefix}{creg.name}"

            qc.add_register(
                ClassicalRegister(
                    creg.size,
                    reg_name,
                )
            )

        # Add classical registers for ancillary measurements
        c_ancs = list()
        if self.parallel_ec:
            for i in range(circuit.num_qubits):
                qc.add_register(c_anc := ClassicalRegister(2, f"c_anc{i}"))
                c_ancs.append(c_anc)
        else:
            qc.add_register(c_anc := ClassicalRegister(2, "c_anc"))
            c_ancs = [c_anc for _ in range(circuit.num_qubits)]

        # Encode all logical qubits with error-correction
        for log in range(circuit.num_qubits):
            self._encode_logical_qubit(qc, qc.qregs[log])

        # NOTE: Adding a barrier for readability
        qc.barrier(label=self.barrier_labels[BarrierType.ENCODE])

        # Encode all gates
        for ins_no, ins in enumerate(circuit.data):

            # Special procedure for conditional operations
            if ins.name == 'if_else':

                # Extract conditional circuit
                conditional_circuit = ins.params[0]

                # Extract condition and translate into output register
                logical_cond_clbits, cond_val = ins.operation.condition
                cond_clbits = list(
                    map(
                        lambda x: qc.cregs[circuit.cregs.index(x)],
                        set(map(
                            lambda x: circuit.find_bit(x).registers[0][0],
                            logical_cond_clbits
                        ))
                    )
                )

                # Perform conditional circuit
                with qc.if_test((cond_clbits[0], cond_val)):

                    # Iterate over conditional circuit gates
                    for inner_ins_no, inner_ins in enumerate(conditional_circuit.data):

                        logical_qubit_indices = list(
                            map(lambda x: circuit.find_bit(x).index, inner_ins.qubits)
                        )
                        logical_clbit_indices = list(
                            map(lambda c: circuit.find_bit(c).index, inner_ins.clbits)
                        )
                        self._encode_logical_gate(
                            qc,
                            inner_ins,
                            logical_qubit_indices,
                            logical_clbit_indices
                        )

                        # TODO: Add error-correction into this part
                        _ = inner_ins_no

                    pass

                # We skip
                continue

            # Compute logical qubits in original circuit
            logical_qubit_indices = list(
                map(lambda x: circuit.find_bit(x).index, ins.qubits)
            )
            logical_clbit_indices = list(
                map(lambda c: circuit.find_bit(c).index, ins.clbits)
            )

            # Encode logical gate
            self._encode_logical_gate(
                qc,
                ins,
                logical_qubit_indices,
                logical_clbit_indices
            )

            # Insert barrier and error-correction
            if ins.name not in ('barrier', 'measure'):

                # Add barrier
                qc.barrier(label=self.barrier_labels[BarrierType.LOGICAL_GATE])

                # Encode error-correction on all affected qubits
                if ins_no % self.ec_every_x_gates == 0:
                    for qb in logical_qubit_indices:
                        self._encode_error_correction(
                            qc, qc.qregs[qb], q_ancs[qb], c_ancs[qb]
                        )

                    qc.barrier(label=self.barrier_labels[BarrierType.ERROR_CORRECT])

        # Return measured circuit
        return qc
