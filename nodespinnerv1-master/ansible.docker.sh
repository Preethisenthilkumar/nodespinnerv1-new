#!/usr/bin/env sh
set -e

# install ansible (from williamyeh/ansible)
apk --update add sudo
apk --update add python py-pip openssl ca-certificates
apk --update add --virtual .build-dependencies python-dev libffi-dev openssl-dev build-base
pip install --upgrade pip cffi
pip install ansible docker-py
apk --update add sshpass openssh-client rsync

apk del .build-dependencies