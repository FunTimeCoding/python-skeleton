#!/bin/sh -e

. .venv/bin/activate
pip list --outdated
pip install --upgrade pip
pip install --upgrade --requirement requirements.txt
pip check
