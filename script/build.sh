#!/bin/sh -e

if [ "${1}" = --ci-mode ]; then
    script/docker/build.sh
else
    script/python/build.sh
fi
