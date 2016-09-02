#!/bin/sh
DEPS="curl ca-certificates"
BUILD_DEPS="git go"
apk add --update ${DEPS} ${BUILD_DEPS}

# I wouldn't know where to start describing how much I dislike the golang build process
## Go build env
mkdir -p /go/src /go/bin
chmod -R 777 /go
export GOPATH=/go
export PATH=/go/bin:$PATH

# Install gof3r
CGO_ENABLED=0 GOOS=linux go get -u github.com/minio/s3verify
cp /go/bin/s3verify /usr/local/bin/

# Cleanup
apk del ${BUILD_DEPS}
rm -rf /var/cache/apk/*
rm -rf /go

rm /$0
