#!/bin/sh -e

~/Code/Personal/jenkins-tools/bin/delete-job.sh python-skeleton || true
~/Code/Personal/jenkins-tools/bin/put-job.sh python-skeleton job.xml
