from python_skeleton.language_example.calculator import Calculator


def test_add() -> None:
    assert Calculator().add(1, 2) == 3


def test_subtract() -> None:
    assert Calculator().subtract(1, 2) == -1
