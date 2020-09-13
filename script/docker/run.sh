#!/bin/sh -e

DIRECTORY=$(dirname "${0}")
SCRIPT_DIRECTORY=$(
    cd "${DIRECTORY}" || exit 1
    pwd
)
# shellcheck source=/dev/null
. "${SCRIPT_DIRECTORY}/../../configuration/project.sh"
# shellcheck source=/dev/null
. "${HOME}/.virtualization-tools.sh"

if [ "${1}" = --help ]; then
    echo "Usage: ${0} --development|[GIT_TAG]"
    echo "Examples:"
    echo "In development: ${0} --development"
    echo "In production: ${0} 1.0.0"

    exit 0
fi

if [ "${1}" = --development ]; then
    DEVELOPMENT=true
    shift
else
    DEVELOPMENT=false
fi

if [ "${DEVELOPMENT}" = true ]; then
    IMAGE="${PROJECT_NAME_DASH}-snapshot"
else
    GIT_TAG="${1}"

    if [ "${GIT_TAG}" = '' ]; then
        GIT_TAG='latest'
    fi

    IMAGE="${PRIVATE_REGISTRY_SERVER}/${VENDOR_NAME_LOWER}/${PROJECT_NAME_DASH}:${GIT_TAG}"
fi

SYSTEM=$(uname)

# TODO: What is the output of uname on Git Bash on Windows 10?
if [ "${SYSTEM}" = 'msys' ]; then
    # TODO: Add volume parameters that work on Windows.
    winpty docker run --interactive --tty --rm --name "${PROJECT_NAME_DASH}-instance" --publish 8080:8080 "${IMAGE}"
else
    # TODO: Make it possible to pass arguments to the container?
    #if [ "${DEVELOPMENT}" = true ]; then
    #    WORKING_DIRECTORY=$(pwd)
    #    # shellcheck disable=SC2068
    #    docker run --interactive --tty --rm --name "${PROJECT_NAME_DASH}-instance" --volume "${WORKING_DIRECTORY}:/${PROJECT_NAME_DASH}" "${IMAGE}" $@
    #else
    #    # shellcheck disable=SC2068
    #    docker run --interactive --tty --rm --name "${PROJECT_NAME_DASH}-instance" "${IMAGE}" $@
    #fi

    # TODO: Always publish port 8080, make configurable or remove?
    docker run --interactive --tty --rm --name "${PROJECT_NAME_DASH}-instance" --publish 8080:8080 --volume "${PWD}/tmp:/go/src/app/tmp" "${IMAGE}"
fi
