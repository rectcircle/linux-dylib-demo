#!/usr/bin/env bash

cd $(dirname $(readlink -f $0))
rm -rf build/bin && mkdir -p build/bin


echo '=== 方式 1: 找不到库情况'
gcc -I ./build/include -o ./build/bin/main ./main.c && echo '构建成功' || echo '构建失败'
echo

echo '=== 方式 2: 使用 LD_LIBRARY_PATH 指定查找路径'
LD_LIBRARY_PATH=./build/lib gcc -I ./build/include -o ./build/bin/main ./main.c -l sample && echo '构建成功' || echo '构建失败'
echo

echo '=== 方式 3: 使用 -L 指定查找路径'
gcc -I ./build/include -o ./build/bin/main ./main.c -L ./build/lib -l sample && echo '构建成功' || echo '构建失败'
echo

echo '=== 方式 4: 使用 LIBRARY_PATH 指定查找路径'
LIBRARY_PATH=./build/lib gcc -I ./build/include -o ./build/bin/main ./main.c -l sample && echo '构建成功' || echo '构建失败'
echo

echo '=== 方式 5: 使用 -L LIBRARY_PATH 指定错误的路径观察查找路径'
mkdir -p /tmp/by_LIBRARY_PATH /tmp/by_-l
LIBRARY_PATH=/tmp/by_LIBRARY_PATH gcc -I ./build/include -o ./build/bin/main ./main.c -L /tmp/by_-l -l sample -Wl,-verbose | grep sample && echo '构建成功' || echo '构建失败'
echo
