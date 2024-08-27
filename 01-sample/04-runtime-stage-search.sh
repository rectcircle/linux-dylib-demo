#!/usr/bin/env bash

cd $(dirname $(readlink -f $0))
rm -rf build/bin && mkdir -p build/bin


echo '=== 准备: 指定 -rpath'
gcc -I ./build/include -o ./build/bin/main ./main.c -L ./build/lib -l sample -Wl,-rpath,/tmp/by_-rpath
echo


echo '=== 验证: 观察查找路径'
mkdir -p /tmp/by_LD_LIBRARY_PATH /tmp/by_-rpath
LD_DEBUG=libs LD_LIBRARY_PATH=/tmp/by_LD_LIBRARY_PATH ./build/bin/main
echo
