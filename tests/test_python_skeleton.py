import os

from mccabe import main as mccabe_main
from python_skeleton.python_skeleton import PythonSkeleton


def test_return_code(capsys) -> None:
    exit_code = PythonSkeleton([]).run()
    assert exit_code == 0
    output, error = capsys.readouterr()
    assert output == 'Hello friend.\n'
    assert error == ''


def test_flake_command(capsys) -> None:
    mccabe_main([os.path.abspath(__file__)])
    output, error = capsys.readouterr()
    assert output != ''
    assert error == ''
