from typing import Optional
from qiskit_aer.noise import (
    NoiseModel,
    QuantumError,
    pauli_error
)


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

def build_z_noise_model(p_error: float, qubits: Optional[list[int]] = None) -> NoiseModel:
    z_error = pauli_error([("Z", p_error), ("I", 1 - p_error)])
    return build_noise_model_from_error(z_error, qubits)

def build_x_noise_model(p_error: float, qubits: Optional[list[int]] = None) -> NoiseModel:
    x_error = pauli_error([("X", p_error), ("I", 1 - p_error)])
    return build_noise_model_from_error(x_error, qubits)

def build_zx_noise_model(p_error: float, qubits: Optional[list[int]] = None) -> NoiseModel:
    z_error = pauli_error([("Z", p_error), ("I", 1 - p_error)])
    x_error = pauli_error([("X", p_error), ("I", 1 - p_error)])
    error = x_error.compose(z_error)
    return build_noise_model_from_error(error, qubits)

def build_noise_model_from_error(error: QuantumError, qubits: Optional[list[int]] = None) -> NoiseModel:
    nm = NoiseModel()
    q2_error = error.tensor(error)

    if qubits is None:
        nm.add_all_qubit_quantum_error(
            error,
            ['x', 'z', 'h', 's']
        )
        nm.add_all_qubit_quantum_error(
            q2_error,
            ['cx']
        )
    else:
        for i, q in enumerate(qubits):
            nm.add_quantum_error(error, ['x', 'z', 'h', 's'], (q,))
            for r in qubits[i+1:]:
                nm.add_quantum_error(q2_error, "cx", (q, r))
                nm.add_quantum_error(q2_error, "cx", (r, q))
    return nm
