#!/bin/sh -e

DIR=$(dirname "${0}")
SCRIPT_DIR=$(cd "${DIR}"; pwd)
echo "Deleting python cache files and directories and the .egg-info directory."
FILES="build .pyvenv .coverage .sonar"

for FILE in ${FILES}; do
    if [ -e "${FILE}" ]; then
        rm -rfv "${SCRIPT_DIR:?}/${FILE}"
    fi
done

find "${SCRIPT_DIR}" \( -name '__pycache__' -o -name '*.egg-info' -o -name '*.pyc' \) -exec ls "{}" +
