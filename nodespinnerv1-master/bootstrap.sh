#!/usr/bin/env sh
set -e

config_volume=core-config
env_file=$2
core_revision=$2

genconfig() {
    docker run --rm -v $config_volume:/config -v $env_file:/env.yml nodespinner genconfig
}

init() {
    docker run --rm -v $HOME/.docker:/root/.docker -v /var/run/docker.sock:/var/run/docker.sock nodespinner init $core_revision
}

start() {
    docker run --rm -v $HOME/.docker:/root/.docker -v /var/run/docker.sock:/var/run/docker.sock nodespinner start $core_revision
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
