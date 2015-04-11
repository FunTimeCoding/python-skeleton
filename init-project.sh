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
INITIALS=$(echo ${CAMEL} | sed 's/\([A-Z]\)[a-z]*/\1/g' | tr '[:upper:]' '[:lower:]')
LAST_WORD=$(echo ${UNDERSCORE} | rev | cut -f1 -d'_' | rev | tr '[:upper:]' '[:lower:]')

echo "Camel: ${CAMEL}"
echo "Underscore: ${UNDERSCORE}"
echo "Dash: ${DASH}"
echo "Initials: ${INITIALS}"

sed -i "" -e "s/ps/${INITIALS}/g" README.md bin/ps tests/test_python_skeleton.py setup.py
sed -i "" -e "s/python_skeleton/${UNDERSCORE}/g" setup.py bin/ps tests/test_python_skeleton.py tests/language_example/test_calculator.py sonar-project.properties
sed -i "" -e "s/PythonSkeleton/${CAMEL}/g" README.md bin/ps tests/test_python_skeleton.py python_skeleton/python_skeleton.py
sed -i "" -e "s/python-skeleton/${DASH}/g" setup.py README.md sonar-project.properties
sed -i "" -e "s/skeleton/${LAST_WORD}/g" bin/ps tests/test_python_skeleton.py

git mv "tests/test_python_skeleton.py" "tests/test_${UNDERSCORE}.py"
git mv "python_skeleton/python_skeleton.py" "python_skeleton/${UNDERSCORE}.py"
git mv "python_skeleton" "${UNDERSCORE}"
git mv "bin/ps" "bin/${INITIALS}"

echo "Done. Files were edited and moved using git. Review those changes. You may also delete this script now."
