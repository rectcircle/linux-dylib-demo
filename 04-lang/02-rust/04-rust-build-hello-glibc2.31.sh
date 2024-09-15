#!/usr/bin/env bash


# 实测 gcc12 无法编译成功，需在 gcc10 环境中编译
# 这里使用 nix 安装 gcc10
# nix-env -iA nixpkgs.gcc10
# export GLIBC_VERSION=2.31
# rm -rf /tmp/glibc-work && mkdir -p /tmp/glibc-work
# cd /tmp/glibc-work
# wget https://ftp.gnu.org/gnu/glibc/glibc-$GLIBC_VERSION.tar.gz -O glibc-$GLIBC_VERSION.tar.gz
# tar -xzf glibc-$GLIBC_VERSION.tar.gz
# rm -rf glibc-$GLIBC_VERSION.tar.gz
# mkdir build
# cd build
# mkdir -p $HOME/.local/share/glibc/glibc-$GLIBC_VERSION
# ../glibc-$GLIBC_VERSION/configure \
#   --prefix=$HOME/.local/share/glibc/glibc-$GLIBC_VERSION \
#   --host=x86_64-linux-gnu \
#   --build=x86_64-linux-gnu \
#   --disable-werror \
#   CC="gcc -m64" \
#   CXX="g++ -m64" \
#   CFLAGS="-O2" \
#   CXXFLAGS="-O2"
# make
# make install
# rm -rf /tmp/glibc-work

cd $(dirname $(readlink -f $0))
cd a01-hello
rm -rf target



echo '=== 构建 hello use glibc 2.31'

# cargo build --target x86_64-unknown-linux-gnu --config "target.x86_64-unknown-linux-gnu.rustflags='-L native=$HOME/.local/share/glibc/glibc-2.31/lib'"
cargo build --config "build.rustflags='-L native=$HOME/.local/share/glibc/glibc-2.31/lib'"
echo '--- 执行产物'
target/debug/a01-hello
echo '--- ldd 查看产物'
ldd target/debug/a01-hello
echo '--- readelf 查看产物的 RUNPATH'
readelf -d target/debug/a01-hello | grep RUNPATH
echo '--- readelf 查看产物版本'
readelf --version-info target/debug/a01-hello
echo '--- patchelf 移除 RUNPATH 设置并设置动态链接器'
patchelf --remove-rpath target/debug/a01-hello
patchelf --set-interpreter /lib64/ld-linux-x86-64.so.2 target/debug/a01-hello
echo '--- ldd 查看产物'
ldd target/debug/a01-hello
echo '--- 执行产物'
target/debug/a01-hello


# nix-env --uninstall gcc-wrapper-10.5.0
