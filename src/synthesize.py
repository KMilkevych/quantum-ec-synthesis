from qiskit import qasm3

from synthesizer.SteaneSynthesizer import SteaneSynthesizer
from synthesizer.ShorSynthesizer import ShorSynthesizer
from synthesizer.BitFlipSynthesizer import BitFlipSynthesizer

def synthesize(
    verbose: int,
    input_circuit: str,
    method: str,
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
        case 'shor':
            synth = ShorSynthesizer()
        case 'steane':
            synth = SteaneSynthesizer()
        case '3-bit-flip-repitition':
            synth = BitFlipSynthesizer()
        case _:
            raise Exception(f'Invalid mehtod: {method}')

    # Perform synthesis
    qc = synth.synthesize(qc)

    if verbose == 1:
        print("OUTPUT CIRCUIT:")
        print(qc)

    # Save circuit to file
    if output_file:
        with open(output_file, 'w') as f:
            qasm3.dump(qc, f)

    pass
