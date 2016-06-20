class PythonSkeleton:
    def __init__(self, arguments: list) -> None:
        pass

    @staticmethod
    def run() -> int:
        exit_code = 0

        PythonSkeleton.hello()

        return exit_code

    @staticmethod
    def hello() -> None:
        print('Hello friend.')
