#!/bin/sh -e

CAPITALIZED=${1}

if [ "${CAPITALIZED}" = "" ]; then
    echo "Usage: ${0} MyCapitalizedProjectName"
    exit 1
fi

if [[ ! ${CAPITALIZED} =~ ^([A-Z][a-z0-9]+){2,}$ ]]; then
    echo "Project name must be in UpperCamelCase."
    exit 1
fi

UNDERSCORE=$(echo ${CAPITALIZED} | sed -E 's/([A-Za-z0-9])([A-Z])/\1_\2/g' | tr '[:upper:]' '[:lower:]')
BIN=$(echo ${UNDERSCORE} | sed -E 's/_/-/g')
INITIALS=$(echo ${CAPITALIZED} | sed 's/\([A-Z]\)[a-z]*/\1/g' | tr '[:upper:]' '[:lower:]' )

echo "Underscore: ${UNDERSCORE}"
echo "Bin: ${BIN}"
echo "Capitalized: ${CAPITALIZED}"
echo "Initials: ${INITIALS}"

exit 0

SUBSITUTE_FILES="bin/example-script test/test_${ORIGINAL_UNDERSCORE}.py"
SED_CMD="sed -i \"\" -e"
${SED_CMD} "s/ec/${INITIALS}/g" ${SUBSITUTE_FILES}
${SED_CMD} "s/example_class/${UNDERSCORE}/g" ${SUBSITUTE_FILES}
${SED_CMD} "s/ExampleClass/${CAPITALIZED}/g" ${SUBSITUTE_FILES}

#mv "test/test_example_class.py" "test/test_${UNDERSCORE}.py"
#mv "bin/example-script" "bin/${INITIALS}"
