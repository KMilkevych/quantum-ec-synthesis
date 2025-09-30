#!/usr/bin/env python3
from code_synthesis.synthesizer import ShorSynthesizer
from code_synthesis.simulator import GenericSimulator, CliffordSimulator
from qiskit import QuantumCircuit, ClassicalRegister, QuantumRegister

N = 1
inc = QuantumCircuit(
    qreg := QuantumRegister(N, 'q_dat'),
    creg := ClassicalRegister(N, 'c_dat')
)
for i in range(N):
    inc.h(i)
# inc.measure_all(creg)
inc.measure(qreg, creg)


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
print(ouc)

# ouc.draw(output='mpl').savefig('circuit.png')

# sim = GenericSimulator()
sim = CliffordSimulator()
re1 = sim.simulate(ouc, creg, samples=100000, noisy=False)
print(re1)

re2 = sim.simulate(inc, creg, samples=100000, noisy=False)
print(re2)
