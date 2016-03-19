class PythonSkeleton:
    def __init__(self, arguments: list):
        pass

    @staticmethod
    def run() -> int:
        PythonSkeleton.hello()

        return 0

    @staticmethod
    def hello() -> None:
        print('Hello friend.')
