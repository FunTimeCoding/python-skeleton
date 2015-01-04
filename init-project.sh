#!/bin/sh -e

CAMEL=${1}

if [ "${CAMEL}" = "" ]; then
    echo "Usage: ${0} MyUpperCamelCaseProjectName"
    exit 1
fi

if [[ ! ${CAMEL} =~ ^([A-Z][a-z0-9]+){2,}$ ]]; then
    echo "Project name must be in UpperCamelCase."
    exit 1
fi

UNDERSCORE=$(echo ${CAMEL} | sed -E 's/([A-Za-z0-9])([A-Z])/\1_\2/g' | tr '[:upper:]' '[:lower:]')
DASH=$(echo ${UNDERSCORE} | sed -E 's/_/-/g')
INITIALS=$(echo ${CAMEL} | sed 's/\([A-Z]\)[a-z]*/\1/g' | tr '[:upper:]' '[:lower:]' )

echo "Camel: ${CAMEL}"
echo "Underscore: ${UNDERSCORE}"
echo "Dash: ${DASH}"
echo "Initials: ${INITIALS}"

SUBSITUTE_FILES="bin/example-script lib/example_class.py test/test_example_class.py"

sed -i "" -e "s/ec/${INITIALS}/g" ${SUBSITUTE_FILES}
sed -i "" -e "s/example_class/${UNDERSCORE}/g" ${SUBSITUTE_FILES}
sed -i "" -e "s/ExampleClass/${CAMEL}/g" ${SUBSITUTE_FILES}

git mv "test/test_example_class.py" "test/test_${UNDERSCORE}.py"
git mv "lib/example_class.py" "lib/${UNDERSCORE}.py"
git mv "bin/example-script" "bin/${INITIALS}"
