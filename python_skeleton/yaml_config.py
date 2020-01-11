from os.path import expanduser, isfile
from typing import Dict, Iterator

from yaml import load_all, dump


class YamlConfig:
    def __init__(self, path: str = ''):
        self.settings: Dict[str, str] = {}
        self.path = expanduser(path)

        if self.exists():
            input_file = open(self.path, 'r')
            self.add_elements(load_all(input_file))
            input_file.close()

    def add_elements(self, elements: Iterator) -> None:
        for dictionary in elements:
            for key, value in dictionary.items():
                self.settings[key] = value

    def exists(self) -> bool:
        result = False

        if isfile(self.path):
            result = True

        return result

    def contains(self, key: str) -> bool:
        result = False

        if key in self.settings:
            result = True

        return result

    def get(self, key: str) -> str:
        return self.settings.get(key, '')

    def set(self, key: str, value: str) -> None:
        self.settings[key] = value

    def remove(self, key: str) -> str:
        return self.settings.pop(key, '')

    def save(self) -> None:
        output_file = open(self.path, 'w')
        output_file.write(dump(self.settings, default_flow_style=False))
        output_file.close()
