from qiskit.circuit.library import Barrier, XGate
from qiskit.circuit import CircuitInstruction
from synthesizer.SteaneSynthesizer import SteaneSynthesizer
from synthesizer.BitFlipSynthesizer import BitFlipSynthesizer
from simulator.CliffordSimulator import CliffordSimulator
from qiskit import QuantumCircuit, ClassicalRegister, QuantumRegister
from qiskit.visualization import plot_histogram
from qiskit_aer.noise import NoiseModel

import matplotlib.pyplot as plt
from matplotlib import color_sequences

from pathlib import Path
from qiskit import qasm3
import csv

from typing import Iterable

from util import build_x_noise_model

def correction_frequency(
        samples=1000,
        p_error=0.01,
        circuit_depth=1024,
):

    # Misc information
    verbose = 1
    log_qubits = 1

    FOLDER_NAME = f"correction-frequency-d{circuit_depth}-p{int(p_error * 100000)}"

    # For storing results
    results = []

    # Prepare circuit
    qc = QuantumCircuit(
        qreg := QuantumRegister(log_qubits, 'q_dat'),
        creg := ClassicalRegister(log_qubits, 'c_dat')
       )
    for q in range(log_qubits):
        for _ in range(circuit_depth):
            qc.x(q)
    qc.measure(qreg, creg)

    print("GENERATED CIRCUIT")
    if verbose == 1: print(qc)

    # Perform experiment
    FREQ = [1, 5, 10, 20, 50, 100, 300, 500, 0]
    for ec_freq1 in FREQ:
        for ec_freq2 in FREQ:

            # Prepare encoder for 3-bit repitition code
            synth = BitFlipSynthesizer(
                barrier_labels=False,
                ec_every_x_gates=ec_freq1,
                parallel_ec=False,
                optimize=False,
                register_name_suffix='_'
               )
            synth2 = BitFlipSynthesizer(
                barrier_labels=False,
                ec_every_x_gates=ec_freq2,
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

            # Prepare noise models
            nm = build_x_noise_model(p_error=p_error)
            ec_nm = build_x_noise_model(p_error=p_error)
            ec_ec_nm = build_x_noise_model(p_error=p_error)

            # Perform simulations
            meas_label = "0" * log_qubits
            print("STARTING SIMULATIONS")
            sim = CliffordSimulator()
            res1 = sim.simulate(qc, "c_dat", samples, nm)
            print(res1)
            res2 = sim.simulate(ec_qc, "c_dat", samples, ec_nm)
            print(res2)
            res3 = sim.simulate(ec_ec_qc, "c_dat", samples, ec_ec_nm)
            print(res3)

            # Add results to list
            results.append(
                (
                    ec_freq1,
                    ec_freq2,
                    res1[meas_label] * 100 / samples,
                    res2[meas_label] * 100 / samples,
                    res3[meas_label] * 100 / samples
                 )
            )

    # Save csv file
    header = ["ec-freq-1", "ec-freq-2", "plain", "ec", "ec-ec"]
    ouf = Path(f"experiments/{FOLDER_NAME}/data.csv")
    ouf.parent.mkdir(parents=True, exist_ok=True)

    with open(ouf, "w", newline="") as csvfile:
        writer = csv.writer(
            csvfile, delimiter=",", quotechar='"', quoting=csv.QUOTE_MINIMAL
        )
        writer.writerow(header)
        writer.writerows(results)

    _, _, _, _, p3_values = zip(*results)

    pres = [[p3_values[i * len(FREQ) + j] for j in range(len(FREQ))] for i in range(len(FREQ))]

    # Create other figure
    fig, ax = plt.subplots(
        figsize=(8,8)
    )

    import numpy as np
    im = ax.imshow(
        pres,
        cmap='viridis',
        origin='lower',
        aspect='equal'
    )

    # Set tick positions and labels to match your grid coordinates
    ax.set_xticks(range(len(FREQ)))
    ax.set_yticks(range(len(FREQ)))
    ax.set_xticklabels(list(map(str, FREQ)))
    ax.set_yticklabels(list(map(str, FREQ)))

    ax.set_xlabel('Inner EC Frequency (no. gates)')
    ax.set_ylabel('Outer EC Frequency (no. gates)')
    ax.set_title(f'EC-freq. Experiment with {p_error * 100}% error-prob., {circuit_depth} circuit depth')

    fig.colorbar(im, ax=ax, label="Correct Measurements (%)")

    # Add exact measurement values
    for i, l in enumerate(pres):
        for j, z in enumerate(l):
            ax.text(
                j, i, f'{z:.2f}',
                ha='center', va='center',
                color='white' if z < 0.8 else 'black',
                fontsize=9, fontweight='bold'
            )

    figure_path = Path(f"experiments/{FOLDER_NAME}/figure.png")
    figure_path.parent.mkdir(parents=True, exist_ok=True)
    fig.savefig(figure_path, dpi=600)

    return

def error_rate(
        samples=1000,
        circuit_depth=1024,
        error_correct=30,
):

    # Misc information
    verbose = 1
    log_qubits = 1

    FOLDER_NAME = f"error-rate-ec{error_correct}-d{circuit_depth}"

    # For storing results
    results = []

    # Prepare circuit
    qc = QuantumCircuit(
        qreg := QuantumRegister(log_qubits, 'q_dat'),
        creg := ClassicalRegister(log_qubits, 'c_dat')
       )
    for q in range(log_qubits):
        for _ in range(circuit_depth):
            qc.x(q)
    qc.measure(qreg, creg)

    # Prepare encoder for 3-bit repitition code
    synth = BitFlipSynthesizer(
        barrier_labels=False,
        ec_every_x_gates=error_correct,
        parallel_ec=False,
        optimize=False,
        register_name_suffix='_'
       )
    synth2 = BitFlipSynthesizer(
        barrier_labels=False,
        ec_every_x_gates=error_correct * 3 + 11,
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
        (qc, "plain.qasm"),
        (ec_qc, "ec.qasm"),
        (ec_ec_qc, "ec-ec.qasm"),
       ]
    for circuit, path_suffix in save_paths:
        path = Path(f"experiments/{FOLDER_NAME}/circuits/{circuit_depth}-{path_suffix}")
        path.parent.mkdir(parents=True, exist_ok=True)
        with open(path, "w") as f:
            qasm3.dump(circuit, f)

    print("GENERATED CIRCUIT")
    if verbose == 1: print(qc)

    # Start experiment
    RATES = [0.1, 0.05, 0.01, 0.005, 0.001, 0.0005, 0.0001, 0.00005, 0.00001]
    RATES = list(reversed(RATES))
    for p_error in RATES:

        # Prepare noise models
        nm = build_x_noise_model(p_error=p_error)
        ec_nm = build_x_noise_model(p_error=p_error)
        ec_ec_nm = build_x_noise_model(p_error=p_error)

        # Perform simulations
        meas_label = "0" * log_qubits
        print("STARTING SIMULATIONS")
        sim = CliffordSimulator()
        res1 = sim.simulate(qc, "c_dat", samples, nm)
        print(res1)
        res2 = sim.simulate(ec_qc, "c_dat", samples, ec_nm)
        print(res2)
        res3 = sim.simulate(ec_ec_qc, "c_dat", samples, ec_ec_nm)
        print(res3)

        # Add results to list
        results.append(
            (
                p_error * 100,
                res1[meas_label] * 100 / samples,
                res2[meas_label] * 100 / samples,
                res3[meas_label] * 100 / samples
             )
        )

    # Save csv file
    header = ["error-probability", "plain", "ec", "ec-ec"]
    ouf = Path(f"experiments/{FOLDER_NAME}/data.csv")
    ouf.parent.mkdir(parents=True, exist_ok=True)

    with open(ouf, "w", newline="") as csvfile:
        writer = csv.writer(
            csvfile, delimiter=",", quotechar='"', quoting=csv.QUOTE_MINIMAL
        )
        writer.writerow(header)
        writer.writerows(results)

    # Create figure
    plot_colors = color_sequences["Set2"][:3]
    fig, ax = plt.subplots(
        figsize=(8, 8),
        sharex=True
    )

    x_values, p1_values, p2_values, p3_values = zip(*results)

    ax.plot(x_values, p1_values, label='plain', marker="o", color=plot_colors[0])
    ax.plot(x_values, p2_values, label='ec', marker="s", color=plot_colors[1])
    ax.plot(x_values, p3_values, label='ec-ec', marker="^", color=plot_colors[2])
    ax.set_xlabel('Error Probability (%)')
    ax.set_ylabel('Correct Measurements (%)')
    ax.set_title(f'Error Rate Experiment with {circuit_depth} circuit depth')

    ax.set_xscale('log', base=10)

    ax.legend()
    ax.grid(True, which='both', ls='--', alpha=0.6)

    # Save figure to file
    figure_path = Path(f"experiments/{FOLDER_NAME}/figure.png")
    figure_path.parent.mkdir(parents=True, exist_ok=True)
    fig.savefig(figure_path, dpi=600)

    return


def circuit_depth(
        samples=1000,
        p_error=0.01,
        error_correct=30,
):

    # Misc information
    verbose = 1
    log_qubits = 1

    FOLDER_NAME = f"circuit-depth-ec{error_correct}-p{int(p_error * 100000)}"

    # For storing results
    results = []

    # Prepare circuit
    DEPTHS = [2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096]
    for circuit_depth in DEPTHS:
        qc = QuantumCircuit(
            qreg := QuantumRegister(log_qubits, 'q_dat'),
            creg := ClassicalRegister(log_qubits, 'c_dat')
           )
        for q in range(log_qubits):
            for _ in range(circuit_depth):
                qc.x(q)
        qc.measure(qreg, creg)

        print("GENERATED CIRCUIT")
        if verbose == 1: print(qc)

        # Prepare encoder for 3-bit repitition code
        synth = BitFlipSynthesizer(
            barrier_labels=False,
            ec_every_x_gates=error_correct,
            parallel_ec=False,
            optimize=False,
            register_name_suffix='_'
           )
        synth2 = BitFlipSynthesizer(
            barrier_labels=False,
            ec_every_x_gates=error_correct * 3 + 11,
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
            (qc, "plain.qasm"),
            (ec_qc, "ec.qasm"),
            (ec_ec_qc, "ec-ec.qasm"),
           ]
        for circuit, path_suffix in save_paths:
            path = Path(f"experiments/{FOLDER_NAME}/circuits/{circuit_depth}-{path_suffix}")
            path.parent.mkdir(parents=True, exist_ok=True)
            with open(path, "w") as f:
                qasm3.dump(circuit, f)

        # Prepare noise models
        nm = build_x_noise_model(p_error=p_error)
        ec_nm = build_x_noise_model(p_error=p_error)
        ec_ec_nm = build_x_noise_model(p_error=p_error)

        # Perform simulations
        meas_label = "0" * log_qubits
        print("STARTING SIMULATIONS")
        sim = CliffordSimulator()
        res1 = sim.simulate(qc, "c_dat", samples, nm)
        print(res1)
        res2 = sim.simulate(ec_qc, "c_dat", samples, ec_nm)
        print(res2)
        res3 = sim.simulate(ec_ec_qc, "c_dat", samples, ec_ec_nm)
        print(res3)

        # Add results to list
        results.append(
            (
                circuit_depth,
                res1[meas_label] * 100 / samples,
                res2[meas_label] * 100 / samples,
                res3[meas_label] * 100 / samples
             )
        )

    # Save csv file
    header = ["circuit-depth", "plain", "ec", "ec-ec"]
    ouf = Path(f"experiments/{FOLDER_NAME}/data.csv")
    ouf.parent.mkdir(parents=True, exist_ok=True)

    with open(ouf, "w", newline="") as csvfile:
        writer = csv.writer(
            csvfile, delimiter=",", quotechar='"', quoting=csv.QUOTE_MINIMAL
        )
        writer.writerow(header)
        writer.writerows(results)

    # Create figure
    plot_colors = color_sequences["Set2"][:3]
    fig, ax = plt.subplots(
        figsize=(8, 8),
        sharex=True
    )

    x_values, p1_values, p2_values, p3_values = zip(*results)

    ax.plot(x_values, p1_values, label='plain', marker="o", color=plot_colors[0])
    ax.plot(x_values, p2_values, label='ec', marker="s", color=plot_colors[1])
    ax.plot(x_values, p3_values, label='ec-ec', marker="^", color=plot_colors[2])
    ax.set_xlabel('Circuit Depth (x-gates)')
    ax.set_ylabel('Correct Measurements (%)')
    ax.set_title(f'Circuit Depth Experiment with {p_error * 100}% error-prob.')

    ax.set_xscale('log', base=2)
    ax.set_xticks(DEPTHS)
    ax.set_xticklabels(list(map(str, DEPTHS)))

    ax.legend()
    ax.grid(True, which='both', ls='--', alpha=0.6)

    # Save figure to file
    figure_path = Path(f"experiments/{FOLDER_NAME}/figure.png")
    figure_path.parent.mkdir(parents=True, exist_ok=True)
    fig.savefig(figure_path, dpi=600)

    return

def snake(verbose: int, samples: int):

    log_qubits = 1
    p_error = 0.1

    # Prepare snake circuit
    for snake_length in [2, 4, 8, 16, 32, 64, 128, 256]:
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
            ec_every_x_gates=4,
            parallel_ec=False,
            optimize=False,
            register_name_suffix='_'
           )
        synth2 = BitFlipSynthesizer(
            barrier_labels=False,
            ec_every_x_gates=4,
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

        # Prepare noise models for noise on data qubits only
        nm = build_x_noise_model(p_error=p_error, qubits=list(range(log_qubits)))
        ec_nm = build_x_noise_model(p_error=p_error, qubits=list(range(log_qubits*3)))
        ec_ec_nm = build_x_noise_model(p_error=p_error, qubits=list(range(log_qubits*3*3)))

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
