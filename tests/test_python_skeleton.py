from python_skeleton.python_skeleton import PythonSkeleton


def test_return_code() -> None:
    application = PythonSkeleton([])
    assert application.run() == 0
