# PythonSkeleton


## Setup

Install the project from a local clone.

```sh
pip3 install -e ../python-skeleton
```

Install the project from GitHub.

```sh
pip3 install git+git://github.com/FunTimeCoding/python-skeleton.git
```

Uninstall the project.

```sh
pip3 uninstall python-skeleton
```


## Development

Run the main script without having to install the project.

```sh
PYTHONPATH=. bin/ps
```

Install development tools.

```sh
pip3 install -U -r requirements.txt
brew install shellcheck
```

Run code style check, metrics and tests.

```sh
./run-style-check.sh
./run-metrics.sh
./run-tests.sh
```

Build project like Jenkins.

```sh
./build.sh
```


## Skeleton details

* The reason why the `tests` directory is not called `test` is because a package named `test` exists.
* The main source code directory is the same name as the package in python packages.
* Dashes in project names become underscores in python code. They are still legit.
