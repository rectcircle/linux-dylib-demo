#!/usr/bin/env bash

cd $(dirname $(readlink -f $0))
cd ../
mkdir -p build/lib
rm -rf build/include

cp -rf ./include ./build
gcc -Wl,-soname,libfoo.so.1 -I ./build/include -shared -fPIC -o ./build/lib/libfoo.so.1.0.0 ./1.0.0/foo.c
echo '--- 查看 so 符号'
readelf -d ./build/lib/libfoo.so.1.0.0 | grep .so
