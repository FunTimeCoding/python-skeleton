#!/bin/sh -e

DIRECTORY=$(dirname "${0}")
SCRIPT_DIRECTORY=$(
    cd "${DIRECTORY}" || exit 1
    pwd
)
# shellcheck source=/dev/null
. "${SCRIPT_DIRECTORY}/../../configuration/project.sh"
rm -rf build .pytest_cache tests/.pytest_cache .scannerwork .mypy_cache "${PROJECT_NAME_UNDERSCORE}/build.py"
