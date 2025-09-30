from abc import ABC, abstractmethod
from qiskit import QuantumCircuit, ClassicalRegister

from qiskit_aer import AerSimulator
# from qiskit_aer.primitives import EstimatorV2 as Estimator
from qiskit_aer.primitives import SamplerV2 as Sampler
from qiskit.transpiler import generate_preset_pass_manager


class Simulator(ABC):

    @abstractmethod
    def simulate(
            self,
            circuit: QuantumCircuit,
            measure_register: ClassicalRegister,
            samples=1000,
            noisy=False
    ) -> dict[str, int]:
        pass


class CliffordSimulator(Simulator):
    '''
    https://quantum.cloud.ibm.com/docs/en/guides/simulate-stabilizer-circuits
    '''

    def __init__(self):
        pass

    def simulate(
            self,
            circuit: QuantumCircuit,
            measure_register: ClassicalRegister,
            samples: int = 1000,
            noisy: bool = False
    ) -> dict[str, int]:

        sampler = Sampler(
            options=dict(backend_options=dict(method='stabilizer'))
        )
        job = sampler.run([circuit], shots=samples)
        result = job.result()

        return getattr(result[0].data, measure_register.name).get_counts()
        # return result[0].data.c_data.get_counts()


class GenericSimulator(Simulator):
    '''
    https://quantum.cloud.ibm.com/docs/en/guides/simulate-with-qiskit-aer
    '''

    def __init__(self):
        pass

    def simulate(
            self,
            circuit: QuantumCircuit,
            measure_register: ClassicalRegister,
            samples: int = 1000,
            noisy: bool = False
    ) -> dict[str, int]:

        # TODO:
        # Should do transpilation to ISA circuit
        # Must do noise simulations using Qiskit AER
        # Figure out how to interleave classical computation
        #
        # IDEA: Use a reference sampler like SamplerV2 in primitives

        # pass_manager = generate_preset_pass_manager(3, AerSimulator())
        # isa_circuit = pass_manager.run(circuit)
        # print("ISA CIRCUIT:\n")
        # print(isa_circuit)

        sampler = Sampler()
        job = sampler.run([circuit], shots=samples)
        result = job.result()

        return getattr(result[0].data, measure_register.name).get_counts()

        # return result[0].data.c_data.get_counts()
