#!/bin/sh -e
# This tool can be used to initialise the template after making a fresh copy to get started quickly.
# The goal is to make it as easy as possible to create scripts that allow easy testing and continuous integration.

CAMEL=$(echo "${1}" | grep -E '^([A-Z][a-z0-9]+){2,}$') || CAMEL=""

if [ "${CAMEL}" = "" ]; then
    echo "Usage: ${0} UpperCamelCaseName"

    exit 1
fi

OS=$(uname)

if [ "${OS}" = "Darwin" ]; then
    SED="gsed"
else
    SED="sed"
fi

DASH=$(echo "${CAMEL}" | ${SED} -E 's/([A-Za-z0-9])([A-Z])/\1-\2/g' | tr '[:upper:]' '[:lower:]')
INITIALS=$(echo "${CAMEL}" | ${SED} 's/\([A-Z]\)[a-z]*/\1/g' | tr '[:upper:]' '[:lower:]')
UNDERSCORE=$(echo "${DASH}" | ${SED} -E 's/-/_/g')
echo "DASH: ${DASH}"
echo "INITIALS: ${INITIALS}"
echo "UNDERSCORE: ${UNDERSCORE}"
find -E . -type f ! -regex '^.*/(build|\.git|\.idea|\.pyvenv)/.*$' -exec sh -c '${1} -i -e "s/PythonSkeleton/${2}/g" -e "s/python-skeleton/${3}/g" -e "s/python_skeleton/${4}/g" -e "s/bin\/ps/bin\/${5}/g" ${6}' '_' "${SED}" "${CAMEL}" "${DASH}" "${UNDERSCORE}" "${INITIALS}" '{}' \;
git mv tests/test_python_skeleton.py "tests/test_${UNDERSCORE}.py"
git mv python_skeleton/python_skeleton.py "python_skeleton/${UNDERSCORE}.py"
git mv python_skeleton "${UNDERSCORE}"
git mv bin/ps "bin/${INITIALS}"
rm init-project.sh sync-project.sh
echo "Done. Files were edited and moved using git. Review those changes."
