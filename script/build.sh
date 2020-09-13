#!/bin/sh -e

if [ "${1}" = --ci-mode ]; then
    script/docker/build.sh --ci-mode
else
    script/python/build.sh
fi
