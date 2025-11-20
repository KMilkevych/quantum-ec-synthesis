from typing import Optional
from qiskit_aer.noise import (
    NoiseModel,
    QuantumError,
    pauli_error
)

from qiskit_ibm_runtime.fake_provider import FakeGeneva

def build_superconductor_noise_model(
) -> NoiseModel:

    # Load source noise model
    noise_model = NoiseModel.from_backend(FakeGeneva())

    # Use these notes for extracting errors
    # Building H: RZ(pi) SX RZ(pi)
    # Building X: SX SX
    # Building Z: RZ(pi)
    # Building S: RZ(pi / 2)

    # Extract error for "h, s, z, x, id, cx"
    q_errors = noise_model._local_quantum_errors

    # Perform error-extract and qubit averaging
    avg = lambda lst : list(lst.values())[0]

    # NOTE: RZ-gates are free
    # rz_error = avg(q_errors["rz"])

    sx_error = avg(q_errors["sx"])
    x_error = avg(q_errors["x"])
    cx_error = avg(q_errors["cx"])
    id_error = avg(q_errors["id"])

    # Extract all readout errors from noise model
    readout_error = avg(noise_model._local_readout_errors)

    # Construct errors for H, Z and S gates
    h_error = sx_error
    # z_error = rz_error
    # s_error = rz_error

    # Construct target noise model
    nm = NoiseModel()
    nm.add_all_qubit_quantum_error(x_error, ['x'])
    nm.add_all_qubit_quantum_error(cx_error, ['cx'])
    nm.add_all_qubit_quantum_error(id_error, ['id'])

    nm.add_all_qubit_quantum_error(h_error, ['h'])
    # nm.add_all_qubit_quantum_error(z_error, ['z'])
    # nm.add_all_qubit_quantum_error(s_error, ['s'])

    nm.add_all_qubit_readout_error(readout_error)

    # Return constructed noise model
    return nm

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
