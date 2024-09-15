#!/usr/bin/env bash

cd $(dirname $(readlink -f $0))

cd ./02-std-cgo
go clean -cache && CGO_LDFLAGS='-Wl,--verbose' go build -x -o main ./
# go clean -cache && CGO_LDFLAGS='-Wl,--verbose' go build -x -ldflags '-linkmode=external' -o main ./
