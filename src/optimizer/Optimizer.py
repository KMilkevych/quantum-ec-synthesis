from abc import ABC, abstractmethod
from qiskit import QuantumCircuit

class Optimizer(ABC):

    @abstractmethod
    def __init__(self):
        pass

    @abstractmethod
    def optimize(self, circuit: QuantumCircuit) -> QuantumCircuit:
        pass
