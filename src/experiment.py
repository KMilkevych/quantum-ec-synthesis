from synthesizer import ShorSynthesizer
from simulator import CliffordSimulator
from qiskit import QuantumCircuit, ClassicalRegister, QuantumRegister

def superposition_circuit(qubits=1, samples=1000):

    # Prepare superposition circuit
    qc = QuantumCircuit(
        qreg := QuantumRegister(qubits, 'q_dat'),
        creg := ClassicalRegister(qubits, 'c_dat')
    )
    for i in range(qubits):
        qc.h(i)
    qc.measure(qreg, creg)

    # Print information
    print("INPUT CIRCUIT:")
    print(qc)

    # Prepare simulator
    sim = CliffordSimulator()

    # Run simulation
    res = sim.simulate(qc, creg, samples=samples, noise_model=None)
    print(f"{samples} SIMULATIONS:")
    print(res)

    # Do error-correction
    synth = ShorSynthesizer()
    qc = synth.synthesize(qc)

    print("ERROR-CORRECTED CIRCUIT:")
    print(qc)

    # Run simulation
    res = sim.simulate(qc, creg, samples=samples, noise_model=None)
    print(f"{samples} SIMULATIONS:")
    print(res)
