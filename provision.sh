#!/bin/sh -e

export DEBIAN_FRONTEND=noninteractive
apt-get --quiet 2 install neovim multitail htop git tree twine build-essential devscripts python3-dev python3-venv libenchant-dev hunspell shellcheck python3-all
