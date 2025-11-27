from optimizer.Optimizer import Optimizer
from qiskit import QuantumCircuit

import qsynth

class QSynthOptimizer(Optimizer):

    def __init__(self):
        pass


    def optimize(self, circuit: QuantumCircuit) -> QuantumCircuit:
        qc = qsynth.peephole_synthesis(
            circuit=circuit,
            slicing="cnot",
            metric='cx-depth_cx-count',
            verbose=1,
        ).circuit
        return qc
