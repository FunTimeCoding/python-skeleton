from python_skeleton.language_example.calculator import Calculator


def test_add() -> None:
    assert 3 == Calculator().add(1, 2)


def test_subtract() -> None:
    assert -1 == Calculator().subtract(1, 2)
