from lib.example_class import ExampleClass


def test_return_code():
    ec = ExampleClass()
    assert ec.run() == 0
