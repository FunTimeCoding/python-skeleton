#!/bin/sh -e

~/src/jenkins-tools/bin/delete-job.sh python-skeleton || true
~/src/jenkins-tools/bin/put-job.sh python-skeleton job.xml
