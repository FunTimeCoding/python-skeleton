# PythonSkeleton

## Setup

Install the project from a local clone.

```sh
pip3 install --user --editable .
```

Install the project from GitHub.

```sh
pip3 install git+ssh://git@github.com/FunTimeCoding/python-skeleton.git#egg=python-skeleton
```

Uninstall the project.

```sh
pip3 uninstall python-skeleton
```

Require this repository in another projects `requirements.txt`.

```
git+ssh://git@github.com/FunTimeCoding/python-skeleton.git#egg=python-skeleton
```


## Development

Run the main script without installing the project.

```sh
PYTHONPATH=. bin/ps
```

Install tools on Debian Jessie.

```sh
apt-get install shellcheck
```

Install tools on OS X.

```sh
brew install shellcheck
```

Install pip requirements.

```sh
pip3 install --upgrade --user --requirement requirements.txt
```

Run code style check, metrics and tests.

```sh
./run-style-check.sh
./run-metrics.sh
./run-tests.sh
```

Build the project like Jenkins.

```sh
./build.sh
```


## Skeleton details

* The `tests` directory is not called `test` because that package already exists.
* Dashes in the project name become underscores in Python.
