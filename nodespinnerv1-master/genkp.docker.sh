#!/usr/bin/env sh
set -e

# install go
apk --update add --virtual .go go musl-dev gcc openssl

# build genkp
GOPATH=$PWD go build -o /bin/genkp src/genkp/main.go

# cleanup
apk del .go