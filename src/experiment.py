from qiskit.circuit.library import Barrier, XGate
from qiskit.circuit import CircuitInstruction
from qiskit.circuit.quantumcircuit import QubitSpecifier
from synthesizer.ShorSynthesizer import ShorSynthesizer
from synthesizer.SteaneSynthesizer import SteaneSynthesizer
from simulator.CliffordSimulator import CliffordSimulator
from qiskit import QuantumCircuit, ClassicalRegister, QuantumRegister
from qiskit.visualization import plot_histogram
from qiskit_aer.noise import (
    NoiseModel,
    QuantumError,
    pauli_error
)
from typing import Iterable


def _insert_random_bitflips(circuit: QuantumCircuit, qubits: Iterable[QubitSpecifier], count=1):
    from random import randrange, choice

    # Find all barriers / placeholders
    barriers = [
        i for i, ins in enumerate(circuit.data) if ins.operation.name == 'barrier'
    ]

    for _ in range(count):
        q = choice(list(qubits))
        i = choice(barriers) + 1
        circuit.data.insert(i, CircuitInstruction(
            operation=XGate(label="ERROR"),
            qubits=(q,),
        ))
        print(circuit.num_qubits)
        circuit.data.insert(i+1, CircuitInstruction(
            operation=Barrier(num_qubits=circuit.num_qubits, label="INSERTED"),
            qubits=circuit.qubits
        ))
    return

def _build_noise_model(n_err_qubits: int, p_error: float = 0.05) -> NoiseModel:
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
    # nm.add_all_qubit_quantum_error(
    #     bitphase_flip,
    #     ['x', 'z', 'h', 's']
    # )
    # nm.add_all_qubit_quantum_error(
    #     two_qubit_bitphase_flip,
    #     ['cx']
    # )
    for i in range(n_err_qubits):
        nm.add_quantum_error(
            bitphase_flip,
            ['x', 'z', 'h', 's'],
            (i,)
        )
        for j in range(i+1, n_err_qubits):
            nm.add_quantum_error(
                two_qubit_bitphase_flip,
                'cx',
                (i, j)
            )
            nm.add_quantum_error(
                two_qubit_bitphase_flip,
                'cx',
                (j, i)
            )
            pass
    return nm

def not_circuit(qubits=1, samples=1000, plot=None, noisy=False, verbose=0):

    # Prepare not circuit
    qc = QuantumCircuit(
        qreg := QuantumRegister(qubits, 'q_dat'),
        creg := ClassicalRegister(qubits, 'c_dat')
    )
    for i in range(qubits):
        qc.x(i)
    # qc.x(0)
    # qc.cx(0, 1)
    # qc.x(0)


    qc.measure(qreg, creg)

    # Print information
    if verbose == 1:
        print("INPUT CIRCUIT:")
        print(qc)

    # Prepare simulator
    sim = CliffordSimulator()

    # Make a noise model
    nm = _build_noise_model(qubits*7, 0.01) if noisy else None

    # qc_err = qc.copy()
    # if noisy:
    #     from random import randrange
    #     qb = randrange(0, qc.num_qubits)
    #     pos = randrange(0, len(qc.data))
    #     qc_err.data.insert(pos, CircuitInstruction(operation=XGate(), qubits=[qb]))
    #     print("ERRONEOUS CIRCUIT:")
    #     print(qc_err)

    # Run simulation
    print(f"{samples} SIMULATIONS:")
    res1 = sim.simulate(qc, creg, samples=samples, noise_model=nm)
    print(res1)

    # Do error-correction
    synth = SteaneSynthesizer()
    qc_ec = synth.synthesize(qc)

    _insert_random_bitflips(qc_ec, range(qubits * 7), 1)

    if verbose == 1:
        print("ERROR-CORRECTED CIRCUIT:")
        print(qc_ec)

    # qc_ec_err = qc_ec.copy()
    # if noisy:
    #     from random import randrange
    #     qb = randrange(0, qc_ec.num_qubits)
    #     pos = randrange(0, len(qc.data))
    #     qc_ec_err.data.insert(pos, CircuitInstruction(operation=XGate(), qubits=[qb]))
    #     print("ERRONEOUS ERROR-CORRECTED CIRCUIT:")
    #     print(qc_ec_err)

    # Run simulation
    print(f"{samples} SIMULATIONS:")
    res2 = sim.simulate(qc_ec, creg, samples=samples, noise_model=nm)
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
