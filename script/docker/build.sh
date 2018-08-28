#!/bin/sh -e

docker images | grep --quiet funtimecoding/python-skeleton && FOUND=true || FOUND=false

if [ "${FOUND}" = true ]; then
    docker rmi funtimecoding/python-skeleton
fi

docker build --tag funtimecoding/python-skeleton .
