#!/usr/bin/env bash

cd $(dirname $(readlink -f $0))
rm -rf build/bin && mkdir -p build/bin


echo '方式 1: 直接指定 so (绝对路径)'
# 写法 1.1: 一步完成
gcc -I ./build/include -o ./build/bin/main ./main.c ./build/lib/libsample.so
echo 'ldd 输出'
ldd ./build/bin/main
./build/bin/main
# 写法 1.2: 分步骤编译
gcc -c -I ./build/include -o ./build/main.o ./main.c
gcc -o ./build/bin/main ./build/main.o ./build/lib/libsample.so
# ldd ./build/bin/main
# ./build/bin/main
# 写法 1.3: 使用 -rpath 将动态库绝对路径写入链接器
gcc -I ./build/include -o ./build/bin/main ./main.c -L ./build/lib -l sample -Wl,-rpath,./build/lib
echo


echo '方式 2: 使用 -L 和 -l 指定动态库'
gcc -I ./build/include -o ./build/bin/main ./main.c -L ./build/lib -l sample
echo 'ldd 输出'
ldd ./build/bin/main
echo '直接执行'
./build/bin/main
echo '指定 LD_LIBRARY_PATH 执行'
LD_LIBRARY_PATH=./build/lib ./build/bin/main
echo


echo '有问题的写法: so 在 main.o 或 main.c 前面'
gcc -I ./build/include -o ./build/bin/main ./build/lib/libsample.so ./main.c
gcc -I ./build/include -L ./build/lib -lsample -o ./build/bin/main ./main.c
# 会报错 undefined reference to `print_hello'
# 原因是：
# 在 gcc 命令参数的顺序是有意义的，-L -l -Wl 相关参数会按照顺序传递给链接器 ld。链接器按照命令行中列出的顺序处理输入文件。当链接器遇到一个文件，它会在当前文件中尝试解析以前的所有未定义的引用。然后它会继续处理下一个文件。如果一个符号在它第一次被引用之前没有被定义（例如，库被列在源文件之前），该符号将保持未定义状态。
echo
