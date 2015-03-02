from python_skeleton.python_skeleton import PythonSkeleton


def test_return_code():
    skeleton = PythonSkeleton()
    assert skeleton.run() == 0
