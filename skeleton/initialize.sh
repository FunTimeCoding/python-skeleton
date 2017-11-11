#!/bin/sh -e

NAME=$(echo "${1}" | grep -E '^([A-Z]+[a-z0-9]*){2,}$') || NAME=""

if [ "${NAME}" = "" ]; then
    echo "Usage: ${0} NAME"
    echo "Name must be in upper camel case."

    exit 1
fi

SYSTEM=$(uname)

if [ "${SYSTEM}" = Darwin ]; then
    SED=gsed
    FIND=gfind
else
    SED=sed
    FIND=find
fi

DASH=$(echo "${NAME}" | ${SED} -E 's/([A-Za-z0-9])([A-Z])/\1-\2/g' | tr '[:upper:]' '[:lower:]')
INITIALS=$(echo "${NAME}" | ${SED} 's/\([A-Z]\)[a-z]*/\1/g' | tr '[:upper:]' '[:lower:]')
UNDERSCORE=$(echo "${DASH}" | ${SED} -E 's/-/_/g')
rm -rf skeleton
# shellcheck disable=SC2016
${FIND} . -type f -regextype posix-extended ! -regex '^.*/(build|tmp|\.git|\.idea|\.venv|\.tox|\.cache|\.vagrant|__pycache__|[a-z_]+\.egg-info)/.*$' -exec sh -c '${1} -i -e "s/PythonSkeleton/${2}/g" -e "s/python-skeleton/${3}/g" -e "s/python_skeleton/${4}/g" -e "s/pyskel/${5}/g" "${6}"' '_' "${SED}" "${NAME}" "${DASH}" "${UNDERSCORE}" "${INITIALS}" '{}' \;
echo "# Dictionary for project domain language." > "dict/${DASH}.dic"
git mv python_skeleton/python_skeleton.py "python_skeleton/${UNDERSCORE}.py"
git mv python_skeleton "${UNDERSCORE}"
git mv tests/test_python_skeleton.py "tests/test_${UNDERSCORE}.py"
