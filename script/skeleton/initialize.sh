#!/bin/sh -e

DIRECTORY=$(dirname "${0}")
SCRIPT_DIRECTORY=$(
    cd "${DIRECTORY}" || exit 1
    pwd
)
# shellcheck source=/dev/null
. "${SCRIPT_DIRECTORY}/../../configuration/project.sh"
NAME=$(echo "${1}" | grep --extended-regexp '^([A-Z]+[a-z0-9]*){1,}$') || NAME=''

if [ "${NAME}" = '' ]; then
    echo "Usage: ${0} NAME"
    echo "Name must be in upper camel case."

    exit 1
fi

SYSTEM=$(uname)

if [ "${SYSTEM}" = Darwin ]; then
    SED='gsed'
    FIND='gfind'
else
    SED='sed'
    FIND='find'
fi

rm -rf script/skeleton
DASH=$(echo "${NAME}" | ${SED} --regexp-extended 's/([A-Za-z0-9])([A-Z])/\1-\2/g' | tr '[:upper:]' '[:lower:]')
INITIALS=$(echo "${NAME}" | ${SED} 's/\([A-Z]\)[a-z]*/\1/g' | tr '[:upper:]' '[:lower:]')
UNDERSCORE=$(echo "${DASH}" | ${SED} --regexp-extended 's/-/_/g')
# shellcheck disable=SC2016
# TODO: Delete after testing the include way works throughout all projects.
#${FIND} . -regextype posix-extended -type f ! -regex "${EXCLUDE_FILTER}" -exec sh -c '${1} --in-place --expression "s/PythonSkeleton/${2}/g" --expression "s/python-skeleton/${3}/g" --expression "s/python_skeleton/${4}/g" "${5}"' '_' "${SED}" "${NAME}" "${DASH}" "${UNDERSCORE}" '{}' \;
${FIND} . -regextype posix-extended -type f -regex "${INCLUDE_FILTER}" -exec sh -c '${1} --in-place --expression "s/PythonSkeleton/${2}/g" --expression "s/python-skeleton/${3}/g" --expression "s/python_skeleton/${4}/g" "${5}"' '_' "${SED}" "${NAME}" "${DASH}" "${UNDERSCORE}" '{}' \;
# shellcheck disable=SC1117
${SED} --in-place --expression "s/pysk/${INITIALS}/g" README.md Dockerfile setup.py
git mv python_skeleton/python_skeleton.py "python_skeleton/${UNDERSCORE}.py"
git mv python_skeleton "${UNDERSCORE}"
git mv tests/test_python_skeleton.py "tests/test_${UNDERSCORE}.py"
echo "# This dictionary file is for domain language." >"documentation/dictionary/${DASH}.dic"
