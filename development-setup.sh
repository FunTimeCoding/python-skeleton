#!/bin/sh -e

wget --quiet --output-document - cfg.shiin.org/python3.sh | sh -e
wget --quiet --output-document - cfg.shiin.org/shellcheck.sh | sh -e
pip3 install --upgrade --user --requirement requirements.txt
pip3 install --user --editable .
