#!/bin/sh -e

SYSTEM=$(uname)

if [ "${SYSTEM}" = Darwin ]; then
    WC=gwc
    FIND=gfind
else
    WC=wc
    FIND=find
fi

FILE_COUNT=$(${FIND} . -type f | ${WC} --lines)
echo "FILE_COUNT: ${FILE_COUNT}"

DIRECTORY_COUNT=$(${FIND} . -type d | ${WC} --lines)
echo "DIRECTORY_COUNT: ${DIRECTORY_COUNT}"

ALL_CODE=$(${FIND} . -name '*.py' | xargs cat)

LINE_COUNT=$(echo "${ALL_CODE}" | ${WC} --lines)
echo "LINE_COUNT: ${LINE_COUNT}"

NON_BLANK_LINE_COUNT=$(echo "${ALL_CODE}" | grep --invert-match --regexp '^$' | ${WC} --lines)
echo "NON_BLANK_LINE_COUNT: ${NON_BLANK_LINE_COUNT}"
