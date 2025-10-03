#!/usr/bin/env python3
from code_synthesis.synthesizer import ShorSynthesizer
from code_synthesis.simulator import GenericSimulator, CliffordSimulator
from qiskit import QuantumCircuit, ClassicalRegister, QuantumRegister

from qiskit_aer.noise import NoiseModel, pauli_error

N = 1
inc = QuantumCircuit(
    qreg := QuantumRegister(N, 'q_dat'),
    creg := ClassicalRegister(N, 'c_dat')
)
for i in range(N):
    # inc.h(i)
    inc.x(i)
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

# Build noise model for bit and phase-flips
nm: NoiseModel = NoiseModel()
nm.add_all_qubit_quantum_error(pauli_error([('X', 0.2), ('I', 0.8)]), ['x', 'h'])
nm.add_all_qubit_quantum_error(pauli_error([('Z', 0.2), ('I', 0.8)]), ['x', 'h'])

re1 = sim.simulate(ouc, creg, samples=100000, noise_model=nm)
print(re1)

# re2 = sim.simulate(inc, creg, samples=100000, noisy=False)
# print(re2)

# qcc = ouc[:5]
# print("EXPERIMENT:")
# print(qcc)
