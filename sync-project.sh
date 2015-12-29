#!/bin/sh -e

usage()
{
    echo "Usage: ${0} TARGET_PROJECT"
}

TARGET_PROJECT="${1}"

if [ "${TARGET_PROJECT}" = "" ]; then
    usage

    exit 1
fi

if [ ! -d "${TARGET_PROJECT}" ]; then
    echo "Target directory does not exist."

    exit 1
fi

CAMEL=$(head -n1 "${TARGET_PROJECT}/README.md" | awk '{ print $2 }' | grep -E '^([A-Z][a-z0-9]+){2,}$') || CAMEL=""

if [ "${CAMEL}" = "" ]; then
    echo "Could not determine project name."

    exit 1
fi

OPERATING_SYSTEM=$(uname)

if [ "${OPERATING_SYSTEM}" = "Darwin" ]; then
    SED="gsed"
else
    SED="sed"
fi

cp ./*.md "${TARGET_PROJECT}"
cp ./*.sh "${TARGET_PROJECT}"
cp sonar-project.properties "${TARGET_PROJECT}"
cp setup.py "${TARGET_PROJECT}"
cp requirements.txt "${TARGET_PROJECT}"
cp .coveragerc "${TARGET_PROJECT}"
cp .gitignore "${TARGET_PROJECT}"
cp .pylintrc "${TARGET_PROJECT}"
cp .pytest-ci.ini "${TARGET_PROJECT}"
cp .pytest.ini "${TARGET_PROJECT}"
rm "${TARGET_PROJECT}/init-project.sh"
rm "${TARGET_PROJECT}/sync-project.sh"
DASH=$(echo "${CAMEL}" | ${SED} -E 's/([A-Za-z0-9])([A-Z])/\1-\2/g' | tr '[:upper:]' '[:lower:]')
INITIALS=$(echo "${CAMEL}" | ${SED} 's/\([A-Z]\)[a-z]*/\1/g' | tr '[:upper:]' '[:lower:]')
UNDERSCORE=$(echo "${DASH}" | ${SED} -E 's/-/_/g')
echo "DASH: ${DASH}"
echo "INITIALS: ${INITIALS}"
echo "UNDERSCORE: ${UNDERSCORE}"
cd "${TARGET_DIRECTORY}"
find -E . -type f ! -regex '^.*/(build|\.git|\.idea|\.pyvenv|\.tox)/.*$' -exec sh -c '${1} -i -e "s/PythonSkeleton/${2}/g" -e "s/python-skeleton/${3}/g" -e "s/python_skeleton/${4}/g" -e "s/bin\/ps/bin\/${5}/g" ${6}' '_' "${SED}" "${CAMEL}" "${DASH}" "${UNDERSCORE}" "${INITIALS}" '{}' \;
echo "Done. Files were copied to ${TARGET_PROJECT} and modified. Review those changes."
