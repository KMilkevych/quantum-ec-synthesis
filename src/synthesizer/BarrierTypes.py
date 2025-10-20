from enum import Enum, auto


class BarrierType(Enum):
    ENCODE = (auto(),)
    DECODE = (auto(),)
    LOGICAL_GATE = (auto(),)
    ERROR_CORRECT = (auto(),)
    MEASURE = (auto(),)
    SOURCE = (auto(),)
    OTHER = auto()
