from argparse import ArgumentParser, Namespace
from sys import argv as argument_vector, exit as system_exit


class PythonSkeleton:
    def __init__(self, parsed_arguments: Namespace) -> None:
        self.parsed_arguments = parsed_arguments

    @staticmethod
    def main() -> None:
        parser = ArgumentParser()
        parser.add_argument('name', nargs='?', default='friend')
        parsed_arguments = parser.parse_args(argument_vector[1:])
        system_exit(PythonSkeleton(parsed_arguments).run())

    def run(self) -> int:
        exit_code = 0
        self.hello()

        return exit_code

    def hello(self) -> None:
        print('Hello ' + self.parsed_arguments.name + '.')
