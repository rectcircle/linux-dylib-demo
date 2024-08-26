#!/usr/bin/env bash

cd $(dirname $(readlink -f $0))
mkdir -p build/bin


echo '=== 步骤 1: 使用 1.0.0 版本编译'
echo '--- 创建软链 ./build/lib/libbar.so -> libbar.so.1.0.0'
rm -rf ./build/lib/libbar.so ./build/lib/libbar.so.1
ln -s libbar.so.1.0.0 ./build/lib/libbar.so
gcc -I ./build/include -o ./build/bin/main_c ./main_c.c -L ./build/lib -l bar
echo '--- ldd 输出'
ldd ./build/bin/main_c
echo '--- readelf -d 查看 so'
readelf -d ./build/bin/main_c | grep .so
echo '--- readelf -s 查看 函数'
readelf -s ./build/bin/main_c | grep print
echo


echo '=== 步骤 2: 运行'
echo '--- 指定 LD_LIBRARY_PATH 只包含 libbar.so.1 -> libbar.so.1.0.0'
rm -rf ./build/lib/libbar.so ./build/lib/libbar.so.1
ln -s libbar.so.1.0.0 ./build/lib/libbar.so.1
LD_LIBRARY_PATH=./build/lib ./build/bin/main_c

echo '--- 指定 LD_LIBRARY_PATH 只包含 libbar.so.1 -> libbar.so.1.1.0'
rm -rf ./build/lib/libbar.so ./build/lib/libbar.so.1
ln -s libbar.so.1.1.0 ./build/lib/libbar.so.1
LD_LIBRARY_PATH=./build/lib ./build/bin/main_c
echo


echo '=== 步骤 3: 使用 1.1.0 版本编译'
echo '--- 创建软链 ./build/lib/libbar.so -> libbar.so.1.1.0'
rm -rf ./build/lib/libbar.so ./build/lib/libbar.so.1
ln -s libbar.so.1.1.0 ./build/lib/libbar.so
gcc -I ./build/include -o ./build/bin/main_c ./main_c.c -L ./build/lib -l bar
echo '--- ldd 输出'
ldd ./build/bin/main_c
echo '--- readelf -d 查看 so'
readelf -d ./build/bin/main_c | grep .so
echo '--- readelf -s 查看 函数'
readelf -s ./build/bin/main_c | grep print
echo


echo '=== 步骤 4: 运行'
echo '--- 指定 LD_LIBRARY_PATH 只包含 libbar.so.1 -> libbar.so.1.0.0'
rm -rf ./build/lib/libbar.so ./build/lib/libbar.so.1
ln -s libbar.so.1.0.0 ./build/lib/libbar.so.1
LD_LIBRARY_PATH=./build/lib ./build/bin/main_c

echo '--- 指定 LD_LIBRARY_PATH 只包含 libbar.so.1 -> libbar.so.1.1.0'
rm -rf ./build/lib/libbar.so ./build/lib/libbar.so.1
ln -s libbar.so.1.1.0 ./build/lib/libbar.so.1
LD_LIBRARY_PATH=./build/lib ./build/bin/main_c

