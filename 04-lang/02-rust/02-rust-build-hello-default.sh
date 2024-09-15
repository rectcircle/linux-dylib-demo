#!/usr/bin/env bash

cd $(dirname $(readlink -f $0))
cd a01-hello
rm -rf target


echo '=== 构建 hello'
echo '--- 构建 dev 产物'
cargo build
# cargo build --profile dev
echo '执行产物'
target/debug/a01-hello
echo 'lld 查看产物'
ldd target/debug/a01-hello
echo 'readelf 查看产物版本'
readelf --version-info target/debug/a01-hello
echo 'readelf 查看产物的 RUNPATH'
readelf -d target/debug/a01-hello | grep RUNPATH

echo '--- 构建 release 产物'
cargo build --release
echo '执行产物'
target/release/a01-hello
echo 'lld 查看产物'
ldd target/release/a01-hello
echo 'readelf 查看产物版本'
readelf --version-info target/release/a01-hello
echo 'readelf 查看产物的 RUNPATH'
readelf -d target/release/a01-hello | grep RUNPATH
echo
