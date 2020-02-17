#!/bin/sh -e

DIRECTORY=$(dirname "${0}")
SCRIPT_DIRECTORY=$(
    cd "${DIRECTORY}" || exit 1
    pwd
)
# shellcheck source=/dev/null
. "${SCRIPT_DIRECTORY}/../configuration/project.sh"

if [ "${1}" = --help ]; then
    echo "Usage: ${0} [--ci-mode]"

    exit 0
fi

if [ "${1}" = --ci-mode ]; then
    script/python/test.sh --ci-mode
else
    script/python/test.sh
fi
