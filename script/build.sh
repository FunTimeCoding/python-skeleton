#!/bin/sh -e

rm -rf build

if [ ! -d "${HOME}/venv" ]; then
    python3 -m venv "${HOME}/venv"
fi

# shellcheck source=/dev/null
. "${HOME}/venv/bin/activate"
pip3 install --upgrade pip
pip3 install wheel
pip3 install --requirement requirements.txt
pip3 install --editable .
script/check.sh --ci-mode
script/measure.sh --ci-mode
script/test.sh --ci-mode
./setup.py bdist_wheel --dist-dir build
SYSTEM=$(uname)

if [ "${SYSTEM}" = Linux ]; then
    script/debian/package.sh
fi

script/publish.sh --ci-mode
# TODO: Finish implementation.
#script/docker/build.sh
