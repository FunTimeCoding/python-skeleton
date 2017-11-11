#!/bin/sh -e

# shellcheck disable=SC2016
jjm --locator https://github.com/FunTimeCoding/python-skeleton.git --build-command script/build.sh --junit build/junit.xml --checkstyle 'build/log/checkstyle-*' --recipients funtimecoding@gmail.com > job.xml
