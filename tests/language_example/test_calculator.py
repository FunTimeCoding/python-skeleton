from python_skeleton.language_example.calculator import Calculator


def test_add() -> None:
    calculator = Calculator()
    expected = 3
    actual = calculator.add(1, 2)
    assert expected == actual


def test_subtract() -> None:
    calculator = Calculator()
    expected = calculator.subtract(1, 2)
    actual = -1
    assert expected == actual
