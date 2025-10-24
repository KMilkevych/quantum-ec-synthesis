from typing import Optional, Iterable
from collections import defaultdict

from qiskit.circuit.gate import Instruction
from qiskit.circuit.quantumcircuit import QubitSpecifier

from synthesizer.Synthesizer import Synthesizer
from synthesizer.BarrierTypes import BarrierType

from qiskit import QuantumCircuit, QuantumRegister, AncillaRegister, ClassicalRegister
from qiskit.circuit.library import ZGate, SGate
from qiskit._accelerate.circuit import CircuitInstruction

from qiskit.transpiler.preset_passmanagers import generate_preset_pass_manager


class SteaneSynthesizer(Synthesizer):
    """
    Error-correcting code synthesizer for the 7-qubit Steane-code
    https://stem.mitre.org/quantum/error-correction-codes/steane-ecc.html
    """

    def __init__(
        self,
        barrier_labels: Optional[bool] = True,
        ec_every_x_gates: int = 1,
        parallel_ec: bool = False,
        optimize: bool = False,
        register_name_suffix: str = "_",
    ):

        print(f"{optimize=}")
        # Initialize barrier labels
        if barrier_labels is True:
            self.barrier_labels = {
                BarrierType.ENCODE: "ENCODE",
                BarrierType.DECODE: "DECODE",
                BarrierType.LOGICAL_GATE: "LOGICAL-GATE",
                BarrierType.ERROR_CORRECT: "ERROR-CORRECTION",
                BarrierType.MEASURE: "MEASURE",
                BarrierType.SOURCE: "SOURCE",
                BarrierType.RESET: "RESET",
                BarrierType.OTHER: None,
            }
        else:
            self.barrier_labels = defaultdict(None)

        # Initialize other options
        self.ec_every_x_gates = ec_every_x_gates
        self.parallel_ec = parallel_ec
        self.optimize = optimize

        # Optimization pass
        self.optimize_pass = generate_preset_pass_manager(optimization_level=3, basis_gates = ['cx', 'x', 'h', 's', 'z'])

        # Set name prefix
        self.register_name_suffix = register_name_suffix

        # Whether to set barriers
        self.barriers = False

    def _encode_logical_qubit(self, circuit: QuantumCircuit, register: QuantumRegister):

        # Encodes logical qubit
        qc = circuit

        if self.optimize:
            qc = QuantumCircuit.copy_empty_like(circuit)

        qc.cx(register[0], register[1])
        qc.cx(register[0], register[2])
        qc.h(register[4])
        qc.h(register[5])
        qc.h(register[6])
        qc.cx(register[6], register[0])
        qc.cx(register[6], register[1])
        qc.cx(register[6], register[3])
        qc.cx(register[5], register[0])
        qc.cx(register[5], register[2])
        qc.cx(register[5], register[3])
        qc.cx(register[4], register[1])
        qc.cx(register[4], register[2])
        qc.cx(register[4], register[3])

        if self.optimize:

            # Optimize sub-circuit
            qc = self.optimize_pass.run(qc)

            # Compose sub-circuit
            circuit.compose(qc, inplace=True)

        return

    def _decode_logical_qubit(self, circuit: QuantumCircuit, register: QuantumRegister):

        # Decodes logical qubit (reverse of encode)
        qc = circuit

        if self.optimize:
            qc = QuantumCircuit.copy_empty_like(circuit)

        qc.cx(register[4], register[3])
        qc.cx(register[4], register[2])
        qc.cx(register[4], register[1])
        qc.cx(register[5], register[3])
        qc.cx(register[5], register[2])
        qc.cx(register[5], register[0])
        qc.cx(register[6], register[3])
        qc.cx(register[6], register[1])
        qc.cx(register[6], register[0])
        qc.h(register[6])
        qc.h(register[5])
        qc.h(register[4])
        qc.cx(register[0], register[2])
        qc.cx(register[0], register[1])

        if self.optimize:

            # Optimize sub-circuit
            qc = self.optimize_pass.run(qc)

            # Compose sub-circuit
            circuit.compose(qc, inplace=True)

        return

    def _encode_gate_transversal(
        self, circuit: QuantumCircuit, gate: Instruction, logical_qubits: list[int]
    ):

        # Apply operation to all physical qubits
        for i in range(7):
            circuit.append(
                gate,
                list(map(lambda idx: idx * 7 + i, logical_qubits))
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

        # Perform measurement of syndromes
        stabilizers = ["0001111", "0110011", "1010101"]

        # First measure bit-flip syndromes
        for i, syndrome in enumerate(stabilizers):
            syndrome = map(int, syndrome)

            # Parse syndrome
            for j, c in enumerate(syndrome):
                if c == 0:
                    continue
                circuit.cx(q_register[j], a_register[i])

        if self.barriers:
            circuit.barrier()

        circuit.measure(a_register, c_register)

        if self.barriers:
            circuit.barrier()

        # Perform bit-flip corrections
        for x in range(7):
            with circuit.if_test((c_register, x + 1)):
                circuit.x(q_register[x])

        if self.barriers:
            circuit.barrier()

        # Reset ancillaries
        circuit.reset(a_register)

        if self.barriers:
            circuit.barrier(a_register)

        # Measure phase-flip syndromes
        for i, syndrome in enumerate(stabilizers):
            syndrome = map(int, syndrome)
            circuit.h(a_register[i])

            # Parse syndrome
            for j, c in enumerate(syndrome):
                if c == 0:
                    continue
                circuit.cx(q_register[j], a_register[i])

            circuit.h(a_register[i])

        if self.barriers:
            circuit.barrier()

        circuit.measure(a_register, c_register)

        if self.barriers:
            circuit.barrier()

        # Perform phase-flip corrections
        for x in range(7):
            with circuit.if_test((c_register, x + 1)):
                circuit.z(q_register[x])

        if self.barriers:
            circuit.barrier()

        # Reset ancillaries
        circuit.reset(a_register)

        if self.barriers:
            circuit.barrier(a_register)

        return

    def _encode_instruction_sequence(
        self,
        circuit: QuantumCircuit,
        original_circuit: QuantumCircuit,
        instructions: Iterable[CircuitInstruction],
        q_ancs: list[AncillaRegister],
        c_ancs: list[ClassicalRegister]
    ):

        # Enumerate over all instructions
        for ins_no, ins in enumerate(instructions):

            # Extract logical quantum and classical bits
            logical_qubits = list(
                map(lambda x: original_circuit.find_bit(x).index, ins.qubits)
            )
            logical_clbits = list(
                map(lambda c: original_circuit.find_bit(c).index, ins.clbits)
            )

            # Match based on instruction type
            match (ins.name):

                # Most gates can be encoded transversally
                case "x" | "z" | "h" | "cx":
                    self._encode_gate_transversal(
                        circuit, ins.operation, logical_qubits
                    )

                # S-gates need special treatment
                case "s":
                    self._encode_gate_transversal(
                        circuit, SGate(), logical_qubits
                    )
                    self._encode_gate_transversal(
                        circuit, ZGate(), logical_qubits
                    )

                    # Measurements should be respected
                case "measure":
                    for qb in logical_qubits:

                        # Always EC before measure
                        self._encode_error_correction(
                            circuit,
                            circuit.qregs[qb],
                            q_ancs[qb],
                            c_ancs[qb]
                        )

                        # Decode and measure
                        self._decode_logical_qubit(circuit, circuit.qregs[qb])
                        if self.barriers:
                            circuit.barrier(
                                label=self.barrier_labels[BarrierType.DECODE]
                            )
                        self._encode_measurement(
                            circuit,
                            ins,
                            logical_qubits,
                            logical_clbits
                        )
                        if self.barriers:
                            circuit.barrier(
                                label=self.barrier_labels[BarrierType.MEASURE]
                            )

                # Resets are implemented as reset and re-encode on physical qubits
                case "reset":

                    # Reset physical qubits
                    for logical_qubit in logical_qubits:
                        circuit.reset([logical_qubit * 7 + i for i in range(7)])

                    # Re-encode logical qubit
                    for logical_qubit in logical_qubits:
                        self._encode_logical_qubit(circuit, circuit.qregs[logical_qubit])

                    # Add barrier
                    if self.barriers:
                        circuit.barrier(
                            label=self.barrier_labels[BarrierType.RESET]
                        )

                case "barrier":

                    barrier_label = (
                        None
                        if (il := ins.operation.label is None)
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

                case "if_else":

                    # Extract conditional circuit
                    conditional_circuit = ins.params[0]

                    # Extract condition and translate into output register
                    logical_cond_clbits, cond_val = ins.operation.condition
                    cond_clbits = list(
                        map(
                            lambda x: circuit.cregs[original_circuit.cregs.index(x)],
                            set(map(
                                lambda x: original_circuit.find_bit(x).registers[0][0],
                                logical_cond_clbits
                            ))
                        )
                    )

                    # Encode conditional part of circuit
                    with circuit.if_test((cond_clbits[0], cond_val)):
                        self._encode_instruction_sequence(
                            circuit,
                            original_circuit,
                            conditional_circuit.data,
                            q_ancs,
                            c_ancs
                        )

                    # Other gates are currently unsupported
                case _:
                    raise Exception(f"Unsupported gatetruction: {ins.name}")

            # Insert barrier and error-correction
            if ins.name not in ('barrier', 'measure', 'reset', 'if_else'):

                # Add barrier
                if self.barriers:
                    circuit.barrier(
                        label=self.barrier_labels[BarrierType.LOGICAL_GATE]
                    )

                # Encode error-correction on all affected qubits
                if self.ec_every_x_gates != 0 and ins_no % self.ec_every_x_gates == 0:
                    for qb in logical_qubits:
                        self._encode_error_correction(
                            circuit,
                            circuit.qregs[qb],
                            q_ancs[qb],
                            c_ancs[qb]
                        )

                    # Add barrier after error-correction
                    if self.barriers:
                        circuit.barrier(
                            label=self.barrier_labels[BarrierType.ERROR_CORRECT]
                        )

        return

    def synthesize(
        self, circuit: QuantumCircuit, data_register: Optional[str] = "c_dat"
    ) -> QuantumCircuit:

        # Resulting circuit
        qc = QuantumCircuit()

        # Encode logical qubits of source circuit as quantum registers
        for log in range(circuit.num_qubits):
            qc.add_register(QuantumRegister(7, f"q_log{log}"))

        # Add ancillary and classical registers for computation
        q_ancs = list()
        if self.parallel_ec:
            for i in range(circuit.num_qubits):
                qc.add_register(q_anc := AncillaRegister(3, f"q_anc{i}"))
                q_ancs.append(q_anc)
        else:
            qc.add_register(q_anc := AncillaRegister(3, "q_anc"))
            q_ancs = [q_anc for _ in range(circuit.num_qubits)]

        # Add classical registers with name-mangling
        for creg in circuit.cregs:
            reg_name = creg.name
            if creg.name.startswith("c_anc"):
                reg_name = f"{creg.name}{self.register_name_suffix}"

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
                qc.add_register(c_anc := ClassicalRegister(3, f"c_anc{i}"))
                c_ancs.append(c_anc)
        else:
            qc.add_register(c_anc := ClassicalRegister(3, "c_anc"))
            c_ancs = [c_anc for _ in range(circuit.num_qubits)]

        # Encode all logical qubits with error-correction
        for log in range(circuit.num_qubits):
            self._encode_logical_qubit(qc, qc.qregs[log])

        # Add barrier for readability
        if self.barriers:
            qc.barrier(
                label=self.barrier_labels[BarrierType.ENCODE]
            )

        # Encode all gates
        self._encode_instruction_sequence(
            qc,
            circuit,
            circuit.data,
            q_ancs,
            c_ancs
        )

        # Return measured circuit
        return qc
