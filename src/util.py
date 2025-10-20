from qiskit_aer.noise import NoiseModel, pauli_error


def build_noise_model(n_err_qubits: int, p_error: float = 0.05) -> NoiseModel:
    nm = NoiseModel()

    # Build errors
    bit_flip = pauli_error([("X", p_error), ("I", 1 - p_error)])
    phase_flip = pauli_error([("Z", p_error), ("I", 1 - p_error)])
    bitphase_flip = bit_flip.compose(phase_flip)
    two_qubit_bitphase_flip = bitphase_flip.tensor(bitphase_flip)

    # Add errors to noise model
    # nm.add_all_qubit_quantum_error(
    #     bitphase_flip,
    #     ['x', 'z', 'h', 's']
    # )
    # nm.add_all_qubit_quantum_error(
    #     two_qubit_bitphase_flip,
    #     ['cx']
    # )
    for i in range(n_err_qubits):
        nm.add_quantum_error(bitphase_flip, ["x", "z", "h", "s"], (i,))
        for j in range(i + 1, n_err_qubits):
            nm.add_quantum_error(two_qubit_bitphase_flip, "cx", (i, j))
            nm.add_quantum_error(two_qubit_bitphase_flip, "cx", (j, i))
            pass
    return nm
