#!/bin/sh -e

# This is a regular expression that never matches with an argument name because empty string would falsely match with all of them.
# That would obscure results.
NON_MATCHING_EXPRESSION=RegularExpressionThatNeverMatches
BAD_NAMES=foo,bar,baz
SYSTEM=$(uname)

if [ "${SYSTEM}" = Darwin ]; then
    DICTIONARY=en_US
else
    DICTIONARY=en
fi

# TODO: --ignore is redundant because find is used to collect files. Improve project structure so pylint itself can collect files.
# missing-docstring: Clean code does not require doc strings everywhere
# redefined-variable-type: Falsely reports inherited return types.
# fix-me: Having TODOs is fine.
# max-args should be 3, but self is counted too
# max-attributes should be kept low, but 3 was too low
# For some reason, some arguments need equals characters.
pylint --reports y --disable missing-docstring,redefined-variable-type,fixme --max-returns 1 --max-args 4 --max-module-lines 300 --max-statements 10 --max-line-length 80 --min-public-methods 1 --max-public-methods 10 --max-parents 3 --max-attributes 4 --max-locals 6 --max-branches 5 --max-bool-expr 1 --max-nested-blocks 3 --ignored-argument-names "${NON_MATCHING_EXPRESSION}" --max-parents 4 --ignore-long-lines "${NON_MATCHING_EXPRESSION}" --good-names '' --bad-names "${BAD_NAMES}" --notes TODO --expected-line-ending-format LF --no-space-check '' --ignore .git --persistent no --spelling-dict "${DICTIONARY}" --spelling-private-dict-file tmp/combined.dic --generate-rcfile >.pylintrc
