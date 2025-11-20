from typing import Optional
from pathlib import Path
from matplotlib import color_sequences
import csv

from qiskit import qasm3
from qiskit.visualization import plot_histogram

from simulator.CliffordSimulator import CliffordSimulator

from util import (
    build_z_noise_model,
    build_x_noise_model,
    build_zx_noise_model,
    build_superconductor_noise_model
)


def simulate(
    verbose: int,
    input_circuit: str,
    samples: int,
    noise_type: Optional[str],
    noise_amplitude: float,
    plot_file: str,
    csv_file: str,
):

    # Container for results
    results = list()

    # Parse circuit
    for circuit_file in input_circuit:

        # Load circuit form file
        qc = qasm3.load(circuit_file)

        if verbose == 1:
            print("INPUT CIRCUIT:")
            print(qc)

        # Prepare noise model
        nm = None
        match noise_type:
            case None:
                pass

            case 'z':
                nm = build_z_noise_model(noise_amplitude)

            case 'x':
                nm = build_x_noise_model(noise_amplitude)

            case 'zx':
                nm = build_zx_noise_model(noise_amplitude)

            case 'superconductor':
                nm = build_superconductor_noise_model()

            case _:
                raise Exception(f"Unexpected noise type: {noise_type}")

        # Prepare simulator
        sim = CliffordSimulator()

        # Simulate
        res = sim.simulate(qc, "c_dat", samples, nm)
        if verbose == 1:
            print(f"{samples} SIMULATIONS:")
            print(res)

        # Save result
        results.append((circuit_file, res))

    # Visualize results as a histogram
    if plot_file:

        # Error kind
        plot_error_desc = None
        match (noise_type):
            case None:
                plot_error_desc = " without noise"
            case 'z':
                plot_error_desc = f" with Z error probability {noise_amplitude * 100}%"
            case 'x':
                plot_error_desc = f" with X error probability {noise_amplitude * 100}%"
            case 'zx':
                plot_error_desc = f" with Z/X error probability {noise_amplitude * 100}%"

        # Prepare figure
        plot_title = f"{samples} samples{plot_error_desc}"
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
        ouf = Path(plot_file)
        ouf.parent.mkdir(parents=True, exist_ok=True)

        fig.savefig(ouf)

    # Save results as csv data file
    if csv_file:

        # Prepare csv header
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
                    row.append(measurements[lab])
                else:
                    row.append(0)
            rows.append(row)

        # Write csv file
        ouf = Path(csv_file)
        ouf.parent.mkdir(parents=True, exist_ok=True)

        with open(ouf, "w", newline="") as csvfile:
            writer = csv.writer(
                csvfile, delimiter=",", quotechar='"', quoting=csv.QUOTE_MINIMAL
            )
            writer.writerow(header)
            writer.writerows(rows)

    return
