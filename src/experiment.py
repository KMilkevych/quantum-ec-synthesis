from qiskit.circuit.library import Barrier, XGate
from qiskit.circuit import CircuitInstruction
from synthesizer.SteaneSynthesizer import SteaneSynthesizer
from synthesizer.BitFlipSynthesizer import BitFlipSynthesizer
from simulator.CliffordSimulator import CliffordSimulator
from qiskit import QuantumCircuit, ClassicalRegister, QuantumRegister
from qiskit.visualization import plot_histogram
from qiskit_aer.noise import NoiseModel
from matplotlib import color_sequences
from pathlib import Path
from qiskit import qasm3
import csv

from typing import Iterable

from util import build_x_noise_model


def snake(verbose: int, samples: int):
    verbose = 0

    log_qubits = 1
    p_error = 0.0001
    # snake_length = 2

    # Prepare snake circuit
    for snake_length in [2, 10, 100, 1000, 10000]:
        qc = QuantumCircuit(
            qreg := QuantumRegister(log_qubits, 'q_dat'),
            creg := ClassicalRegister(log_qubits, 'c_dat')
           )
        for q in range(log_qubits):
            for _ in range(snake_length):
                qc.x(q)
        qc.measure(qreg, creg)

        print("GENERATED CIRCUIT")
        if verbose == 1: print(qc)

        # Prepare encoder for 3-bit repitition code
        synth = BitFlipSynthesizer(
            barrier_labels=False,
            ec_every_x_gates=30,
            parallel_ec=False,
            optimize=False,
            register_name_suffix='_'
           )
        synth2 = BitFlipSynthesizer(
            barrier_labels=False,
            ec_every_x_gates=101,
            parallel_ec=False,
            optimize=False,
            register_name_suffix='_'
           )

        # Synthesize circuits
        print("STARTING EC SYNTHESIS")
        ec_qc = synth.synthesize(qc)
        print("LEVEL 1 SYNTHESIZED")
        if verbose == 1: print(ec_qc)
        ec_ec_qc = synth2.synthesize(ec_qc)
        print("LEVEL 2 SYNTHESIZED")
        if verbose == 1: print(ec_ec_qc)

        # Save circuits to files
        save_paths = [
            (qc, "snake.qasm"),
            (ec_qc, "ec-snake.qasm"),
            (ec_ec_qc, "ec-ec-snake.qasm"),
           ]
        for circuit, path_suffix in save_paths:
            path = Path("experiments/snake/circuits/" + path_suffix)
            path.parent.mkdir(parents=True, exist_ok=True)
            with open(path, "w") as f:
                qasm3.dump(circuit, f)

        # Prepare noise models
        # nm = build_x_noise_model(p_error=p_error, qubits=list(range(log_qubits)))
        # ec_nm = build_x_noise_model(p_error=p_error, qubits=list(range(log_qubits*3)))
        # ec_ec_nm = build_x_noise_model(p_error=p_error, qubits=list(range(log_qubits*3*3)))
        nm = build_x_noise_model(p_error=p_error)
        ec_nm = build_x_noise_model(p_error=p_error)
        ec_ec_nm = build_x_noise_model(p_error=p_error)

        # Perform simulations
        print("STARTING SIMULATIONS")
        sim = CliffordSimulator()
        res1 = sim.simulate(qc, "c_dat", samples, nm)
        print(res1)
        res2 = sim.simulate(ec_qc, "c_dat", samples, ec_nm)
        print(res2)
        res3 = sim.simulate(ec_ec_qc, "c_dat", samples, ec_ec_nm)
        print(res3)

        # Prepare plot
        results = [
            ("snake", res1),
            ("ec-snake", res2),
            ("ec-ec-snake", res3),
           ]
        plot_title = f"{samples} samples with {p_error * 100}% X-error probability on data qubits"
        plot_legends = list(map(lambda x: x[0], results))
        plot_results = list(map(lambda x: x[1], results))
        plot_colors = color_sequences["Set2"][: len(plot_results)]

        fig = plot_histogram(
            plot_results,
            legend=plot_legends,
            sort="asc",
            figsize=(15, 12),
            color=plot_colors,
            title=plot_title,
           )

        # Save figure to file
        figure_path = Path(f"experiments/snake/snake{snake_length}-{log_qubits}q_{int(p_error*10000)}.png")
        figure_path.parent.mkdir(parents=True, exist_ok=True)
        fig.savefig(figure_path)

        # Save csv results to file
        meas_labels = sorted(
            list(set.union(*map(lambda m: set(m.keys()), map(lambda x: x[1], results))))
           )
        header = ["circuit"] + meas_labels

        # Prepare csv rows
        rows = []
        for circuit, measurements in results:
            row = [circuit]
            for lab in meas_labels:
                if lab in measurements.keys():
                    row.append(str(measurements[lab]))
                else:
                    row.append(str(0))
            rows.append(row)

        # Write csv file
        ouf = Path(f"experiments/snake/snake{snake_length}-{log_qubits}q_{int(p_error*10000)}.csv")
        ouf.parent.mkdir(parents=True, exist_ok=True)

        with open(ouf, "w", newline="") as csvfile:
            writer = csv.writer(
                csvfile, delimiter=",", quotechar='"', quoting=csv.QUOTE_MINIMAL
            )
            writer.writerow(header)
            writer.writerows(rows)

    return

# def _insert_random_bitflips(
#     circuit: QuantumCircuit, qubits: Iterable[QubitSpecifier], count=1
# ):
#     from random import randrange, choice

#     # Find all barriers / placeholders
#     barriers = [
#         i for i, ins in enumerate(circuit.data) if ins.operation.name == "barrier"
#     ]

#     for _ in range(count):
#         q = choice(list(qubits))
#         i = choice(barriers) + 1
#         circuit.data.insert(
#             i,
#             CircuitInstruction(
#                 operation=XGate(label="ERROR"),
#                 qubits=(q,),
#             ),
#         )
#         print(circuit.num_qubits)
#         circuit.data.insert(
#             i + 1,
#             CircuitInstruction(
#                 operation=Barrier(num_qubits=circuit.num_qubits, label="INSERTED"),
#                 qubits=circuit.qubits,
#             ),
#         )
#     return
