#!/bin/sh -e

CAMEL=$(echo "${1}" | grep -E '^([A-Z]+[a-z0-9]*){2,}$') || CAMEL=""

if [ "${CAMEL}" = "" ]; then
    echo "Usage: ${0} UpperCamelCaseName"
    echo "This tool is to initialize the project after cloning."
    echo "The goal is to make easy to create and test new projects."

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

DASH=$(echo "${CAMEL}" | ${SED} -E 's/([A-Za-z0-9])([A-Z])/\1-\2/g' | tr '[:upper:]' '[:lower:]')
INITIALS=$(echo "${CAMEL}" | ${SED} 's/\([A-Z]\)[a-z]*/\1/g' | tr '[:upper:]' '[:lower:]')
UNDERSCORE=$(echo "${DASH}" | ${SED} -E 's/-/_/g')
rm init-project.sh sync-project.sh
# shellcheck disable=SC2016
${FIND} . -type f -regextype posix-extended ! -regex '^.*/(build|tmp|\.git|\.idea|\.venv|\.tox|\.cache|\.vagrant|__pycache__|[a-z_]+\.egg-info)/.*$' -exec sh -c '${1} -i -e "s/PythonSkeleton/${2}/g" -e "s/python-skeleton/${3}/g" -e "s/python_skeleton/${4}/g" -e "s/pyskel/${5}/g" "${6}"' '_' "${SED}" "${CAMEL}" "${DASH}" "${UNDERSCORE}" "${INITIALS}" '{}' \;
echo "# Dictionary for project domain language." > "dict/${DASH}.dic"
git mv python_skeleton/python_skeleton.py "python_skeleton/${UNDERSCORE}.py"
git mv python_skeleton "${UNDERSCORE}"
git mv tests/test_python_skeleton.py "tests/test_${UNDERSCORE}.py"
