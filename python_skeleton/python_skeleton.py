class PythonSkeleton:
    def __init__(self, arguments: list):
        pass

    @staticmethod
    def run():
        PythonSkeleton.hello()

        return 0

    @staticmethod
    def hello():
        print('Hello friend.')
