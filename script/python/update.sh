#!/bin/sh -e

script/python/venv.sh
# shellcheck source=/dev/null
. "${HOME}/venv/bin/activate"
# Update pip first before even checking the list. List fails on Stretch because pip is too old.
pip install --upgrade pip
pip list --outdated
pip install --upgrade wheel
pip install --requirement requirements.txt
pip install --editable .

# Do not abort on CI if check fails.
if [ "${1}" = --ci-mode ]; then
    pip check || true
else
    pip check
fi
