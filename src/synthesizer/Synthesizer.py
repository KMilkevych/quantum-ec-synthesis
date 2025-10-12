from abc import ABC, abstractmethod
from typing import Optional
from qiskit import QuantumCircuit

class Synthesizer(ABC):

    @abstractmethod
    def __init__(
            self,
            barrier_labels: Optional[bool] = None,
            ec_every_x_gates: int = 1,
            parallel_ec: bool = False
    ):
        pass

    @abstractmethod
    def synthesize(self, circuit: QuantumCircuit) -> QuantumCircuit:
        pass

