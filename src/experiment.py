from synthesizer import ShorSynthesizer
from simulator import CliffordSimulator
from qiskit import QuantumCircuit, ClassicalRegister, QuantumRegister
from qiskit.visualization import plot_histogram

def not_circuit(qubits=1, samples=1000, plot=None):

    # Prepare not circuit
    qc = QuantumCircuit(
        qreg := QuantumRegister(qubits, 'q_dat'),
        creg := ClassicalRegister(qubits, 'c_dat')
    )
    for i in range(qubits):
        qc.x(i)

    qc.measure(qreg, creg)

    # Print information
    print("INPUT CIRCUIT:")
    print(qc)

    # Prepare simulator
    sim = CliffordSimulator()

    # Run simulation
    res1 = sim.simulate(qc, creg, samples=samples, noise_model=None)
    print(f"{samples} SIMULATIONS:")
    print(res1)

    # Do error-correction
    synth = ShorSynthesizer()
    qc = synth.synthesize(qc)

    print("ERROR-CORRECTED CIRCUIT:")
    print(qc)

    # Run simulation
    res2 = sim.simulate(qc, creg, samples=samples, noise_model=None)
    print(f"{samples} SIMULATIONS:")
    print(res2)

    # Write visualization
    if plot:
        fig = plot_histogram(
            [
                res1,
                res2
            ],
            legend=["original", "error-corrected"],
            sort="desc",
            figsize=(15, 12),
            # color=["orange", "black"]
        )
        fig.savefig(plot)
