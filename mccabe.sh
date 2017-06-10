#!/bin/sh -e

flake8 --exclude=.venv,.git,.idea,.tox --verbose --max-complexity 5
