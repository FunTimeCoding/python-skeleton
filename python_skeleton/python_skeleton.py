from argparse import ArgumentParser
from sys import argv as argument_vector, exit as system_exit


class PythonSkeleton:
    def __init__(self, arguments: list) -> None:
        self.arguments = arguments

    @staticmethod
    def main() -> None:
        system_exit(PythonSkeleton(argument_vector[1:]).run())

    def run(self) -> int:
        exit_code = 0
        self.hello()

        return exit_code

    def hello(self) -> None:
        parser = ArgumentParser()
        parser.add_argument('name', nargs='?', default='friend')
        parsed_arguments = parser.parse_args(self.arguments)
        print('Hello ' + parsed_arguments.name + '.')
