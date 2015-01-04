#!/bin/sh

NAME=${1}

if [ "${NAME}" = "" ]; then
    echo "usage: ${0} SomeCapitalizedProjectName"
    exit 1
fi

UNDERSCORE_NAME="asdf_asdf"
DASH_NAME="asdf-asdf"
CAPITALIZED_NAME="AsdfAsdf"
INITIALS="aa"

#SED_CMD="sed -i \"\" -e"
SED_CMD="sed -e"

${SED_CMD} "s/ec/${INITIALS}/g" "bin/example-script" "test/test_example_class.py"
${SED_CMD} "s/example_class/${UNDERSCORE_NAME}/g" "bin/example-script" "test/test_example_class.py"
${SED_CMD} "s/ExampleClass/${CAPITALIZED_NAME}/g" "bin/example-script" "test/test_example_class.py"

#mv "test/test_example_class.py" "test/test_${UNDERSCORE_NAME}.py"
#mv "bin/example-script" "bin/${DASH_NAME}"

echo "Project initialized as: ${CAPITALIZED_NAME}"
