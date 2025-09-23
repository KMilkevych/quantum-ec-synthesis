#!/usr/bin/env python3

from code_synthesis.synthesizer import ShorSynthesizer
from qiskit import QuantumCircuit

inc = QuantumCircuit(2)
inc.x(0)
inc.cx(0, 1)
inc.h(0)

print("INPUT CIRCUIT:")
print(inc)

synth = ShorSynthesizer()
ouc = synth.synthesize(inc)

print("\nOUTPUT CIRCUIT:")
print(ouc)
