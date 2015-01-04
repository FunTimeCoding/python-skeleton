from nose.tools import eq_
from lib.example_class import ExampleClass


def test_return_code():
    ec = ExampleClass()
    eq_(ec.run(), 0)
