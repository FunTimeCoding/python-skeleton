# PythonSkeleton

## Usage

This section explains how to use this project.

Run the main entry point program.

```sh
PYTHONPATH=. bin/ps
```


## Setup

This section explains how to install and uninstall this project.

Install the project.

```sh
pip3 install git+https://git@github.com/FunTimeCoding/python-skeleton.git#egg=python-skeleton
```

Uninstall the project.

```sh
pip3 uninstall python-skeleton
```


## Development

This section explains commands to help the development of this project.

Install the project from a local clone.

```sh
./development-setup.sh
```

Run tests, style check and metrics.

```sh
./run-tests.sh
./run-style-check.sh
./run-metrics.sh
```

Build the project.

```sh
./build.sh
```


## Skeleton

This section explains details of the project skeleton.

- The `tests` directory is not called `test` because there is a package with that name.
- Dashes in project names become underscores in Python.
