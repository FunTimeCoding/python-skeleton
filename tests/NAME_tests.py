from nose.tools import eq_
from lib.my_class import MyClass


def test_my_method():
    x = MyClass()
    eq_(x.myMethod(), 1)
