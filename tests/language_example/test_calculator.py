from lib.language_example.calculator import Calculator


def test_add_numbers():
    ec = Calculator()
    assert ec.add(1, 2) == 3
