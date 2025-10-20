from simulator.Simulator import Simulator

from qiskit import QuantumCircuit, ClassicalRegister
from qiskit_aer import AerSimulator
from qiskit_aer.primitives import SamplerV2 as Sampler
from qiskit_aer.noise import NoiseModel
from qiskit.transpiler import generate_preset_pass_manager


class CliffordSimulator(Simulator):
    """
    https://quantum.cloud.ibm.com/docs/en/guides/simulate-stabilizer-circuits
    """

    def __init__(self):
        pass

    def simulate(
        self,
        circuit: QuantumCircuit,
        measure_register: str,
        samples: int = 1000,
        noise_model: NoiseModel = None,
    ) -> dict[str, int]:

        sampler = Sampler(
            options=dict(
                backend_options=dict(method="stabilizer", noise_model=noise_model)
            )
        )
        job = sampler.run([circuit], shots=samples)
        result = job.result()

        return getattr(result[0].data, measure_register).get_counts()
