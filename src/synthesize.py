from qiskit import qasm3

from synthesizer.SteaneSynthesizer import SteaneSynthesizer
from synthesizer.BitFlipSynthesizer import BitFlipSynthesizer


def synthesize(
        verbose: int,
        input_circuit: str,
        method: str,
        optimize: bool,
        ec_frequency: int,
        output_file: str
):

    # Parse circuit
    qc = qasm3.load(input_circuit)

    if verbose == 1:
        print("INPUT CIRCUIT:")
        print(qc)

    # Parse method for synthesis
    synth = None
    match (method):
        case "steane":
            synth = SteaneSynthesizer(
                optimize=optimize,
                ec_every_x_gates=ec_frequency,
            )
        case "3-bit":
            synth = BitFlipSynthesizer(
                optimize=optimize,
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
