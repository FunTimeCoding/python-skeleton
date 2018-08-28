#!/bin/sh -e

# Development mode mounts the project root so it can be edited and re-ran without rebuilding the image and recreating the container.

if [ "${1}" = --development ]; then
    DEVELOPMENT=true
else
    DEVELOPMENT=false
fi

docker ps --all | grep --quiet python-skeleton && FOUND=true || FOUND=false

if [ "${FOUND}" = false ]; then
    WORKING_DIRECTORY=$(pwd)

    if [ "${DEVELOPMENT}" = true ]; then
        docker create --name python-skeleton --volume "${WORKING_DIRECTORY}:/python-skeleton" funtimecoding/python-skeleton
    else
        docker create --name python-skeleton funtimecoding/python-skeleton
    fi

    # TODO: Specifying the entry point overrides CMD in Dockerfile. Is this useful, or should all sub commands go through one entry point script? I'm inclined to say one entry point script per project.
    #docker create --name python-skeleton --volume "${WORKING_DIRECTORY}:/python-skeleton" --entrypoint /python-skeleton/bin/other.sh funtimecoding/python-skeleton
    #docker create --name python-skeleton funtimecoding/python-skeleton /python-skeleton/bin/other.sh
    # TODO: Run tests this way?
    #docker create --name python-skeleton funtimecoding/python-skeleton /python-skeleton/script/docker/test.sh
fi

docker start --attach python-skeleton
