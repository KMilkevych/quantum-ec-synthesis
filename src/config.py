SYNTHESIZE_METHODS: list[str] = [
    "steane",
    "3-bit",
]
CIRCUIT_KINDS: list[str] = [
    "all",
    "identity",
    "x",
    "h",
    "x-chain",
    "entangle",
    "random-clifford",
]
NOISE_KINDS: list[str] = [
    "z",
    "x",
    "zx",
    "superconductor",
]
EXPERIMENT_KINDS: list[str] = [
    "circuit-depth",
    "error-rate",
    "correction-frequency",
    "clifford-gate-count",
    "clifford-error-rate",
]
OPTIMIZERS: list[str] = [
    "qiskit",
    "q-synth"
]
