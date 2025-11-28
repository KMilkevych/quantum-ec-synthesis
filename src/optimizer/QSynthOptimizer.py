from functools import cache
from qiskit import qasm2


from optimizer.Optimizer import Optimizer
from qiskit import QuantumCircuit
from qiskit.circuit.quantumcircuitdata import QuantumCircuitData

import qsynth

class QSynthOptimizer(Optimizer):

    def __init__(self):
        pass

    @cache
    def _optimize_inner(self, str_circuit: str) -> QuantumCircuit:

        # Re-construct circuit
        circuit = QuantumCircuit.from_qasm_str(str_circuit)

        # Optimize circuit
        qc = qsynth.peephole_synthesis(
            circuit=circuit,
            slicing="cnot",
            metric='cx-depth_cx-count',
            verbose=-1,
        ).circuit

        return qc

    def optimize(self, circuit: QuantumCircuit) -> QuantumCircuit:

        # De-construct circuit
        str_circuit = qasm2.dumps(circuit)

        # Optimize
        return self._optimize_inner(str_circuit)
