#!/usr/bin/env bash

cd $(dirname $(readlink -f $0))
rm -rf build/lib && mkdir -p build/lib
rm -rf build/include

cp -rf ./include ./build
gcc -I ./build/include -shared -fPIC -o ./build/lib/libsample.so.1.0.0 ./sample.c
ln -s libsample.so.1.0.0 ./build/lib/libsample.so
echo '--- 查看 build/lib 目录'
ls -al ./build/lib
echo '--- 查看 so 符号'
readelf -d ./build/lib/libsample.so.1.0.0 | grep .so
