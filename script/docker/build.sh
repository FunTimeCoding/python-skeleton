#!/bin/sh -e

DIRECTORY=$(dirname "${0}")
SCRIPT_DIRECTORY=$(
    cd "${DIRECTORY}" || exit 1
    pwd
)
# shellcheck source=/dev/null
. "${SCRIPT_DIRECTORY}/../../configuration/project.sh"
docker build --tag "${PROJECT_NAME_DASH}-snapshot" .

GIT_TAG=$(git describe --exact-match --tags HEAD 2>/dev/null || echo '')

if [ ! "${GIT_TAG}" = '' ]; then
    script/docker/publish.sh "${GIT_TAG}"
    script/kubernetes/deploy.sh "${GIT_TAG}"
fi

# Save space on CI.
# TODO: Confirm this does not slow down builds too much.
if [ "${1}" = --ci-mode ]; then
    docker rmi "${PROJECT_NAME_DASH}-snapshot"
fi
