from lib.python_skeleton import PythonSkeleton


def test_return_code():
    ps = PythonSkeleton()
    assert ps.run() == 0
