#!/bin/sh -e

TARGET="${1}"

if [ "${TARGET}" = "" ]; then
    echo "Usage: ${0} TARGET_PROJECT"

    exit 1
fi

if [ ! -d "${TARGET}" ]; then
    echo "Target directory ${TARGET} does not exist."

    exit 1
fi

CAMEL=$(head -n 1 "${TARGET}"/README.md | awk '{ print $2 }' | grep --extended-regexp '^([A-Z]+[a-z0-9]*){2,}$') || CAMEL=""

if [ "${CAMEL}" = "" ]; then
    echo "Could not determine project name in ${TARGET}."

    exit 1
fi

OPERATING_SYSTEM=$(uname)

if [ "${OPERATING_SYSTEM}" = Darwin ]; then
    FIND=gfind
    SED=gsed
else
    FIND=find
    SED=sed
fi

cp ./*.md "${TARGET}"
cp ./*.sh "${TARGET}"
cp tox.ini "${TARGET}"
cp requirements.txt "${TARGET}"
cp sonar-project.properties "${TARGET}"
cp setup.py "${TARGET}"
cp dict/* "${TARGET}/dict"
cp doc/* "${TARGET}/doc"
cp .coveragerc "${TARGET}"
cp .gitignore "${TARGET}"
cp .pylintrc "${TARGET}"
cp .pytest.ini "${TARGET}"
cp .pytest-ci.ini "${TARGET}"
DASH=$(echo "${CAMEL}" | ${SED} --regexp-extended 's/([A-Za-z0-9])([A-Z])/\1-\2/g' | tr '[:upper:]' '[:lower:]')
INITIALS=$(echo "${CAMEL}" | ${SED} 's/\([A-Z]\)[a-z]*/\1/g' | tr '[:upper:]' '[:lower:]')
UNDERSCORE=$(echo "${DASH}" | ${SED} --regexp-extended 's/-/_/g')
cd "${TARGET}" || exit 1
rm init-project.sh sync-project.sh
mv dict/python-skeleton.dic "dict/${DASH}.dic"
# shellcheck disable=SC2016
${FIND} . -type f -regextype posix-extended ! -regex '^.*/(build|\.git|\.idea|\.pyvenv|\.tox|__pycache__)/.*$' -exec sh -c '${1} -i -e "s/PythonSkeleton/${2}/g" -e "s/python-skeleton/${3}/g" -e "s/python_skeleton/${4}/g" -e "s/bin\/ps/bin\/${5}/g" "${6}"' '_' "${SED}" "${CAMEL}" "${DASH}" "${UNDERSCORE}" "${INITIALS}" '{}' \;
