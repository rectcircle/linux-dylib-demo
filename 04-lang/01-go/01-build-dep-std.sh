#!/usr/bin/env bash

cd $(dirname $(readlink -f $0))

echo '=== 编译 01-std-nonecgo'
cd ./01-std-nonecgo
go build -o main ./
echo '--- ldd 输出如下'
ldd ./main
cd ../
echo

echo '=== 编译 02-std-cgo'
cd ./02-std-cgo
go clean -cache && CGO_LDFLAGS=-Labc go build -o main ./
echo '--- ldd 输出如下'
ldd ./main
echo '--- readelf -r 输出如下'
readelf -r ./main
cd ../
echo

# echo '=== 在 nix 编译 02-std-cgo 指定使用 debian 系统的库'
# cd ./02-std-cgo
# # https://packages.debian.org/buster/amd64/libc6/filelist
# # https://packages.debian.org/buster/amd64/libc6-dev/filelist
# mkdir -p /tmp/debian-libc6-dev
# # -Wl,--verbose 
# CGO_LDFLAGS='-L /tmp/debian-libc6-dev -L /lib/x86_64-linux-gnu -Wl,-rpath=/lib/x86_64-linux-gnu -Wl,--dynamic-linker=/lib64/ld-linux-x86-64.so.2 ' go build -o main ./
# ldd ./main
# echo

# cd $(dirname $(readlink -f $0))
# cd ./02-std-cgo
# export PATH=/home/rectcircle/.gvm/gos/go1.23.1/bin
# # CGO_LDFLAGS='-Wl,--verbose' 必须和 gcc -linkmode internal 一起使用，等价于 go build -ldflags '-linkmode internal -extldflags -Wl,--verbose'
# go clean -cache && CGO_ENABLED=1 go build -x -o main ./main.go
# # go clean -cache && go build -x -o main ./main.go
