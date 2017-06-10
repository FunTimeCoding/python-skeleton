#!/bin/sh -e

# shellcheck disable=SC2016
jjm --locator https://github.com/FunTimeCoding/python-skeleton.git --build-command ./build.sh --junit build/junit.xml > job.xml
