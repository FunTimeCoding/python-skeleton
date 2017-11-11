from python_skeleton.python_skeleton import PythonSkeleton
from mccabe import main as mccabe_main


def test_return_code(capsys) -> None:
    exit_code = PythonSkeleton([]).run()
    assert exit_code == 0
    output, error = capsys.readouterr()
    assert output == 'Hello friend.\n'
    assert error == ''


def test_flake_command(capsys) -> None:
    mccabe_main()
    output, error = capsys.readouterr()
    assert output != ''
    assert error == ''
