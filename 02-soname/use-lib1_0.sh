#!/usr/bin/env bash

cd $(dirname $(readlink -f $0))
mkdir -p build/bin


echo '=== 步骤 1: 使用 1.0.0 版本编译'
echo '--- 创建软链 ./build/lib/libfoo.so -> libfoo.so.1.0.0'
rm -rf ./build/lib/libfoo.so ./build/lib/libfoo.so.1
ln -s libfoo.so.1.0.0 ./build/lib/libfoo.so
gcc -I ./build/include -o ./build/bin/main1_0 ./main1_0.c -L ./build/lib -l foo
echo '--- ldd 输出'
ldd ./build/bin/main1_0
echo '--- readelf -d 输出'
readelf -d ./build/bin/main1_0 | grep .so
echo


echo '=== 步骤 2: 运行'
echo '--- 直接运行'
./build/bin/main1_0

echo '--- 指定 LD_LIBRARY_PATH 只包含 libfoo.so -> libfoo.so.1.0.0'
rm -rf ./build/lib/libfoo.so ./build/lib/libfoo.so.1
ln -s libfoo.so.1.0.0 ./build/lib/libfoo.so
LD_LIBRARY_PATH=./build/lib ./build/bin/main1_0

echo '--- 指定 LD_LIBRARY_PATH 只包含 libfoo.so.1 -> libfoo.so.1.0.0'
rm -rf ./build/lib/libfoo.so ./build/lib/libfoo.so.1
ln -s libfoo.so.1.0.0 ./build/lib/libfoo.so.1
LD_LIBRARY_PATH=./build/lib ./build/bin/main1_0

echo '--- 指定 LD_LIBRARY_PATH 只包含 libfoo.so.1 -> libfoo.so.1.1.0'
rm -rf ./build/lib/libfoo.so ./build/lib/libfoo.so.1
ln -s libfoo.so.1.1.0 ./build/lib/libfoo.so.1
LD_LIBRARY_PATH=./build/lib ./build/bin/main1_0
echo


echo '=== 步骤 3: 使用 1.1.0 版本编译'
echo '--- 创建软链 ./build/lib/libfoo.so -> libfoo.so.1.1.0'
rm -rf ./build/lib/libfoo.so ./build/lib/libfoo.so.1
ln -s libfoo.so.1.1.0 ./build/lib/libfoo.so
gcc -I ./build/include -o ./build/bin/main1_0 ./main1_0.c -L ./build/lib -l foo
echo '--- ldd 输出'
ldd ./build/bin/main1_0
echo '--- readelf -d 输出'
readelf -d ./build/bin/main1_0 | grep .so
echo

echo '=== 步骤 4: 运行'
echo '--- 直接运行'
./build/bin/main1_0

echo '--- 指定 LD_LIBRARY_PATH 只包含 libfoo.so -> libfoo.so.1.0.0'
rm -rf ./build/lib/libfoo.so ./build/lib/libfoo.so.1
ln -s libfoo.so.1.0.0 ./build/lib/libfoo.so
LD_LIBRARY_PATH=./build/lib ./build/bin/main1_0

echo '--- 指定 LD_LIBRARY_PATH 只包含 libfoo.so.1 -> libfoo.so.1.0.0'
rm -rf ./build/lib/libfoo.so ./build/lib/libfoo.so.1
ln -s libfoo.so.1.0.0 ./build/lib/libfoo.so.1
LD_LIBRARY_PATH=./build/lib ./build/bin/main1_0

echo '--- 指定 LD_LIBRARY_PATH 只包含 libfoo.so.1 -> libfoo.so.1.1.0'
rm -rf ./build/lib/libfoo.so ./build/lib/libfoo.so.1
ln -s libfoo.so.1.1.0 ./build/lib/libfoo.so.1
LD_LIBRARY_PATH=./build/lib ./build/bin/main1_0
