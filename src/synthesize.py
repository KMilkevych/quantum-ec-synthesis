from typing import Optional
from qiskit import qasm3

from synthesizer.SteaneSynthesizer import SteaneSynthesizer
from synthesizer.BitFlipSynthesizer import BitFlipSynthesizer

from optimizer.QiskitOptimizer import QiskitOptimizer
# from optimizer.QSynthOptimizer import QSynthOptimizer


def synthesize(
        verbose: int,
        input_circuit: str,
        method: str,
        optimizer: Optional[str],
        ec_frequency: int,
        output_file: str
):

    # Parse circuit
    qc = qasm3.load(input_circuit)

    if verbose == 1:
        print("INPUT CIRCUIT:")
        print(qc)

    # Prepare optimizer
    optimizer_instance = None
    match (optimizer):
        case None:
            pass

        case "qiskit":
            optimizer_instance = QiskitOptimizer()

        case "q-synth":
            optimizer_instance = QSynthOptimizer()

        case _:
            raise Exception(f"Invalid optimizer: {optimizer}")

    # Parse method for synthesis
    synth = None
    match (method):
        case "steane":
            synth = SteaneSynthesizer(
                optimizer=optimizer_instance,
                ec_every_x_gates=ec_frequency,
            )
        case "3-bit":
            synth = BitFlipSynthesizer(
                optimizer=optimizer_instance,
                ec_every_x_gates=ec_frequency,
            )
        case _:
            raise Exception(f"Invalid mehtod: {method}")

    # Perform synthesis
    qc = synth.synthesize(qc)

    if verbose == 1:
        print("OUTPUT CIRCUIT:")
        print(qc)

    # Save circuit to file
    if output_file:
        with open(output_file, "w") as f:
            qasm3.dump(qc, f)

    return
