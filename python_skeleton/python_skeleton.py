from sys import argv as argument_vector, exit as system_exit


class PythonSkeleton:
    def __init__(self, arguments: list) -> None:
        pass

    @staticmethod
    def main() -> None:
        system_exit(PythonSkeleton(argument_vector[1:]).run())

    def run(self) -> int:
        exit_code = 0
        self.hello()

        return exit_code

    @staticmethod
    def hello() -> None:
        print('Hello friend.')
