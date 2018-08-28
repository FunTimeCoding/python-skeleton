#!/bin/sh -e

script/docker/remove.sh

# Remove image.
docker rmi funtimecoding/python-skeleton

# Remove dangling image identifiers, and more.
docker system prune
