#!/bin/sh -e
# This tool can be used to initialise the template after making a fresh copy to get started quickly.
# The goal is to make it as easy as possible to create scripts that allow easy testing and continuous integration.

CAMEL=${1}

if [ "${CAMEL}" = "" ]; then
    echo "Usage: ${0} MyUpperCamelCaseProjectName"
    exit 1
fi

if [[ ! ${CAMEL} =~ ^([A-Z][a-z0-9]+){2,}$ ]]; then
    echo "Project name must be in UpperCamelCase."
    exit 1
fi

DASH=$(echo ${CAMEL} | sed -E 's/([A-Za-z0-9])([A-Z])/\1-\2/g' | tr '[:upper:]' '[:lower:]')
UNDERSCORE=$(echo ${DASH} | sed -E 's/-/_/g')
INITIALS=$(echo ${CAMEL} | sed 's/\([A-Z]\)[a-z]*/\1/g' | tr '[:upper:]' '[:lower:]' )

echo "Camel: ${CAMEL}"
echo "Underscore: ${UNDERSCORE}"
echo "Dash: ${DASH}"
echo "Initials: ${INITIALS}"

sed -i "" -e "s/ps/${INITIALS}/g" bin/ps tests/test_python_skeleton.py setup.py README.md
sed -i "" -e "s/python_skeleton/${UNDERSCORE}/g" bin/ps tests/test_python_skeleton.py
sed -i "" -e "s/PythonSkeleton/${CAMEL}/g" bin/ps tests/test_python_skeleton.py lib/python_skeleton.py README.md
sed -i "" -e "s/python-skeleton/${DASH}/g" setup.py build.xml README.md
sed -i "" -e "s/ps/${INITIALS}/g" setup.py

git mv "tests/test_python_skeleton.py" "tests/test_${UNDERSCORE}.py"
git mv "lib/python_skeleton.py" "lib/${UNDERSCORE}.py"
git mv "bin/ps" "bin/${INITIALS}"

echo "Done. Files were edited and moved using git. Review those changes. You may also delete this script now."
