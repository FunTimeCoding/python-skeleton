#!/bin/sh -e

NAME=${1}

if [ "${NAME}" = "" ]; then
    echo "Usage: ${0} SomeCapitalizedProjectName"
    exit 1
fi

if [[ ! ${NAME} =~ ^([A-Z][a-z0-9]+){2,}$ ]]; then
    echo "Name must be UpperCamelCase."
    exit 1
fi

ORIGINAL_UNDERSCORE_NAME="example_class"
ORIGINAL_BIN_NAME="example-script"
ORIGINAL_CAPITALIZED_NAME="ExampleClass"

NEW_UNDERSCORE_NAME=$(echo ${NAME} | sed -E 's/([A-Za-z0-9])([A-Z])/\1_\2/g')
NEW_BIN_NAME=$(echo ${NEW_UNDERSCORE_NAME} | sed -E 's/_/-/g')
NEW_CAPITALIZED_NAME=${NAME}
NEW_INITIALS=$(echo ${NAME} | sed 's/\([A-Z]\)[a-z]*/\1/g')

NEW_UNDERSCORE_NAME=$(echo ${NEW_UNDERSCORE_NAME} | tr '[:upper:]' '[:lower:]')
NEW_BIN_NAME=$(echo ${NEW_BIN_NAME} | tr '[:upper:]' '[:lower:]')

echo "Underscore: ${NEW_UNDERSCORE_NAME}"
echo "Script: ${NEW_BIN_NAME}"
echo "Capitalized: ${NEW_CAPITALIZED_NAME}"
echo "Initials: ${NEW_INITIALS}"

SED_CMD="sed -i \"\" -e"
#SED_CMD="sed -e"

SUBSITUTE_FILES="bin/${ORIGINAL_BIN_NAME} test/test_${ORIGINAL_UNDERSCORE_NAME}.py"

exit 0

${SED_CMD} "s/ec/${NEW_INITIALS}/g" ${SUBSITUTE_FILES}
${SED_CMD} "s/${ORIGINAL_UNDERSCORE_NAME}/${NEW_UNDERSCORE_NAME}/g" ${SUBSITUTE_FILES}
${SED_CMD} "s/${ORIGINAL_CAPITALIZED_NAME}/${NEW_CAPITALIZED_NAME}/g" ${SUBSITUTE_FILES}

#mv "test/test_${ORIGINAL_UNDERSCORE_NAME}.py" "test/test_${NEW_UNDERSCORE_NAME}.py"
#mv "bin/${ORIGINAL_BIN_NAME}" "bin/${NEW_BIN_NAME}"
