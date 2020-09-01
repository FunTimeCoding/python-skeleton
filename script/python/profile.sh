#!/bin/sh -e

DIRECTORY=$(dirname "${0}")
SCRIPT_DIRECTORY=$(
    cd "${DIRECTORY}" || exit 1
    pwd
)
# shellcheck source=/dev/null
. "${SCRIPT_DIRECTORY}/../../configuration/project.sh"
ENTRYPOINT=$(command -v "${PROJECT_NAME_INITIALS}")
python -m cProfile -o tmp/profile.prof "${ENTRYPOINT}"
snakeviz tmp/profile.prof
