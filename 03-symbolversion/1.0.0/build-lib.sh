#!/usr/bin/env bash

# https://github.com/bminor/glibc/blob/master/string/Versions
# https://www.gnu.org/software/gnulib/manual/html_node/LD-Version-Scripts.html

cd $(dirname $(readlink -f $0))
cd ../
mkdir -p build/lib
rm -rf build/include

cp -rf ./include ./build
# -Xlinker --version-script ./1.0.0/libbar.map 等价于 -Wl,--version-script,./1.0.0/libbar.map
gcc -Wl,-soname,libbar.so.1 -Xlinker --version-script ./1.0.0/libbar.map -I ./build/include -shared -fPIC -o ./build/lib/libbar.so.1.0.0 ./1.0.0/bar.c
echo '--- 查看 so 符号'
readelf -d ./build/lib/libbar.so.1.0.0 | grep .so
