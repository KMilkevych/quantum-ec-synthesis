from synthesizer.ShorSynthesizer import ShorSynthesizer
from simulator.CliffordSimulator import CliffordSimulator
from qiskit import QuantumCircuit, ClassicalRegister, QuantumRegister
from qiskit.visualization import plot_histogram
from qiskit_aer.noise import (
    NoiseModel,
    QuantumError,
    pauli_error
)

def _build_noise_model(p_error: float = 0.05) -> NoiseModel:
    nm = NoiseModel()

    # Build errors
    bit_flip = pauli_error([
        ("X", p_error),
        ("I", 1 - p_error)
    ])
    phase_flip = pauli_error([
        ("Z", p_error),
        ("I", 1 - p_error)
    ])
    bitphase_flip = bit_flip.compose(phase_flip)
    two_qubit_bitphase_flip = bitphase_flip.tensor(bitphase_flip)

    # Add errors to noise model
    nm.add_all_qubit_quantum_error(
        bitphase_flip,
        ['x', 'z', 'h', 's']
    )
    nm.add_all_qubit_quantum_error(
        two_qubit_bitphase_flip,
        ['cx']
    )
    # for i in range(n_err_qubits):
    #     nm.add_quantum_error(
    #         bitphase_flip,
    #         ['x', 'z', 'h', 's'],
    #         (i,)
    #     )
    #     for j in range(i+1, n_err_qubits):
    #         nm.add_quantum_error(
    #             two_qubit_bitphase_flip,
    #             'cx',
    #             (i, j)
    #         )
    #         nm.add_quantum_error(
    #             two_qubit_bitphase_flip,
    #             'cx',
    #             (j, i)
    #         )
    return nm

def not_circuit(qubits=1, samples=1000, plot=None, noisy=False):

    # Prepare not circuit
    qc = QuantumCircuit(
        qreg := QuantumRegister(qubits, 'q_dat'),
        creg := ClassicalRegister(qubits, 'c_dat')
    )
    # for i in range(qubits):
    #     qc.x(i)
    qc.x(0)
    qc.cx(0, 1)
    qc.x(0)



    qc.measure(qreg, creg)

    # Print information
    print("INPUT CIRCUIT:")
    print(qc)

    # Prepare simulator
    sim = CliffordSimulator()

    # Make a noise model
    nm = _build_noise_model(0.05) if noisy else None

    # Run simulation
    res1 = sim.simulate(qc, creg, samples=samples, noise_model=nm)
    print(f"{samples} SIMULATIONS:")
    print(res1)

    # Do error-correction
    synth = ShorSynthesizer()
    qc = synth.synthesize(qc)

    print("ERROR-CORRECTED CIRCUIT:")
    print(qc)

    # Run simulation
    res2 = sim.simulate(qc, creg, samples=samples, noise_model=nm)
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
            sort="asc",
            figsize=(15, 12),
            color=["orange", "black"]
        )
        fig.savefig(plot)
