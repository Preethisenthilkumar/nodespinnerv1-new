#!/usr/bin/env sh
set -e

revision=$2

start() {
    ansible-playbook -e core_revision=$revision run.yml
}

init() {
    ansible-playbook -e core_revision=$revision init.yml
}

genconfig() {
    ansible-playbook genconfig.yml
}

case "$1" in
    "init")
        init
        ;;
    "start")
        start
        ;;
    "genconfig")
        genconfig
        ;;
esac