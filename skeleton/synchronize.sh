#!/bin/sh -e

TARGET="${1}"

if [ "${TARGET}" = "" ]; then
    echo "Usage: ${0} TARGET"

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

SYSTEM=$(uname)

if [ "${SYSTEM}" = Darwin ]; then
    FIND=gfind
    SED=gsed
else
    FIND=find
    SED=sed
fi

cp ./*.md "${TARGET}"
cp ./*.py "${TARGET}"
cp ./*.sh "${TARGET}"
cp ./*.bat "${TARGET}"
mkdir -p "${TARGET}/dict"
cp dict/* "${TARGET}/dict"
mkdir -p "${TARGET}/doc"
cp doc/* "${TARGET}/doc"
mkdir -p "${TARGET}/debian"
cp debian/* "${TARGET}/debian"
mkdir -p "${TARGET}/script"
cp script/* "${TARGET}/script"
cp requirements.txt "${TARGET}"
cp Vagrantfile "${TARGET}"
cp sonar-project.properties "${TARGET}"
cp tox.ini "${TARGET}"
cp .coveragerc "${TARGET}"
cp .gitignore "${TARGET}"
cp .pylintrc "${TARGET}"
cp .pytest.ini "${TARGET}"
cp .pytest-ci.ini "${TARGET}"
DASH=$(echo "${CAMEL}" | ${SED} --regexp-extended 's/([A-Za-z0-9])([A-Z])/\1-\2/g' | tr '[:upper:]' '[:lower:]')
INITIALS=$(echo "${CAMEL}" | ${SED} 's/\([A-Z]\)[a-z]*/\1/g' | tr '[:upper:]' '[:lower:]')
UNDERSCORE=$(echo "${DASH}" | ${SED} --regexp-extended 's/-/_/g')
cd "${TARGET}" || exit 1
rm -rf skeleton
touch "dict/${DASH}.dic"
# shellcheck disable=SC2016
${FIND} . -type f -regextype posix-extended ! -regex '^.*/(build|tmp|\.git|\.idea|\.venv|\.tox|\.cache|\.vagrant|__pycache__|[a-z_]+\.egg-info)/.*$' -exec sh -c '${1} --in-place --expression "s/PythonSkeleton/${2}/g" --expression "s/python-skeleton/${3}/g" --expression "s/python_skeleton/${4}/g" --expression "s/pyskel/${5}/g" "${6}"' '_' "${SED}" "${CAMEL}" "${DASH}" "${UNDERSCORE}" "${INITIALS}" '{}' \;
