from optimizer.Optimizer import Optimizer
from qiskit import QuantumCircuit

from qiskit.transpiler.preset_passmanagers import generate_preset_pass_manager

class QiskitOptimizer(Optimizer):

    def __init__(self):
        # TODO: Choose the correct set of basis gates
        self.opt_pass = generate_preset_pass_manager(
            optimization_level=3,
            basis_gates = ['cx', 'x', 'h', 's', 'z']
        )

    def optimize(self, circuit: QuantumCircuit) -> QuantumCircuit:
        return self.opt_pass.run(circuit)
