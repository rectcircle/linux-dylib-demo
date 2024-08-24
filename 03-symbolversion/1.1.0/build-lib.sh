#!/usr/bin/env bash


cd $(dirname $(readlink -f $0))
cd ../
mkdir -p build/lib
rm -rf build/include

cp -rf ./include ./build
gcc -Wl,-soname,libbar.so.1 -Xlinker --version-script ./1.1.0/libbar.map -I ./build/include -shared -fPIC -o ./build/lib/libbar.so.1.1.0 ./1.1.0/bar.c
echo '--- 查看 so 符号'
readelf -d ./build/lib/libbar.so.1.1.0 | grep .so
echo '--- 查看 print 函数'
readelf -s ./build/lib/libbar.so.1.0.0 | grep print
