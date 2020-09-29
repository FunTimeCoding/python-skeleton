#!/bin/sh -e

script/clean.sh
script/python/update.sh --ci-mode

# shellcheck source=/dev/null
. "${HOME}/venv/bin/activate"

script/check.sh --ci-mode
script/test.sh --ci-mode
script/measure.sh --ci-mode

#SYSTEM=$(uname)
#
# TODO: Needs polish.
#if [ "${SYSTEM}" = Linux ]; then
#    script/debian/package.sh
#    script/python/package.sh
#fi
