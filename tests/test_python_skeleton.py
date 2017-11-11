from python_skeleton.python_skeleton import PythonSkeleton
from mccabe import main as mccabe_main


def test_return_code() -> None:
    assert PythonSkeleton([]).run() == 0


def test_flake_command(capsys) -> None:
    mccabe_main()
    output, error = capsys.readouterr()
    assert '' == error
    assert '' != output
