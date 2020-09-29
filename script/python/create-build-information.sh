#!/bin/sh -e

DIRECTORY=$(dirname "${0}")
SCRIPT_DIRECTORY=$(
    cd "${DIRECTORY}" || exit 1
    pwd
)
# shellcheck source=/dev/null
. "${SCRIPT_DIRECTORY}/../../configuration/project.sh"

GIT_HASH=$(git rev-parse --short HEAD)
GIT_TAG=$(git describe --exact-match --tags HEAD 2>/dev/null || git rev-parse --abbrev-ref HEAD)
BUILD_DATE=$(date)

# TODO: Files should be included in the Python package and then loaded somehow
#mkdir -p build
#echo "${GIT_HASH}" >build/git-hash.txt
#echo "${GIT_TAG}" >build/git-tag.txt
#echo "${BUILD_DATE}" >build/build-date.txt

echo "class Build:
    GIT_HASH = '${GIT_HASH}'
    GIT_TAG = '${GIT_TAG}'
    BUILD_DATE = '${BUILD_DATE}'" >"${PROJECT_NAME_UNDERSCORE}/build.py"
