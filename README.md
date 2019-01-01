# PythonSkeleton

## Setup

This section explains how to install and uninstall the project.

Install project dependencies.

```sh
script/setup.sh
```

Install pip package from GitHub.

```sh
pip3 install git+https://git@github.com/FunTimeCoding/python-skeleton.git#egg=python-skeleton
```

Install pip package from DevPi.

```sh
pip3 install -i https://testpypi.python.org/pypi python-skeleton
```

Uninstall package.

```sh
pip3 uninstall python-skeleton
```


## Usage

This section explains how to use the project.

Run the main program.

```sh
pyskel
```


## Development

This section explains how to improve the project.

Configure Git on Windows before cloning. This avoids problems with Vagrant and VirtualBox.

```sh
git config --global core.autocrlf input
```

Create the development virtual machine on Linux and Darwin.

```sh
script/vagrant/create.sh
```

Create the development virtual machine on Windows.

```bat
script\vagrant\create.bat
```

Run tests, style check and metrics.

```sh
script/test.sh [--ci-mode]
script/check.sh [--ci-mode]
script/measure.sh [--ci-mode]
```

Build project.

```sh
script/build.sh
```

Install Debian package.

```sh
sudo dpkg --install build/python3-python-skeleton_0.1.0-1_all.deb
```

Show files the package installed.

```sh
dpkg-query --listfiles python3-python-skeleton
```
