#!/usr/bin/env python3

from code_synthesis.synthesizer import ShorSynthesizer
from code_synthesis.simulator import GenericSimulator, CliffordSimulator
from qiskit import QuantumCircuit, ClassicalRegister, QuantumRegister

N = 6
inc = QuantumCircuit(QuantumRegister(N, 'q_dat'), ClassicalRegister(N, 'c_data'))
for i in range(N):
    inc.h(i)
inc.measure_all()


# inc = QuantumCircuit(2, 1)
# inc.x(0)
# inc.cx(0, 1)
# inc.h(0)
# inc.measure(0, 0)

# inc = QuantumCircuit(1)
# inc.x(0)


print("INPUT CIRCUIT:")
print(inc)

synth = ShorSynthesizer()
ouc = synth.synthesize(inc)

print("\nOUTPUT CIRCUIT:")
# print(ouc)

# ouc.draw(output='mpl').savefig('circuit.png')

sim = GenericSimulator()
# sim = CliffordSimulator()
re1 = sim.simulate(ouc)
print(re1)
