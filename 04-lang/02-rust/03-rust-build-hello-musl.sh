#!/usr/bin/env bash

# rustup target add x86_64-unknown-linux-musl
# wget https://musl.cc/x86_64-linux-musl-cross.tgz -O x86_64-linux-musl-cross.tgz
# mkdir -p ~/.local/share/musl
# tar -xzf x86_64-linux-musl-cross.tgz -C ~/.local/share/musl
# ~/.local/share/musl/x86_64-linux-musl-cross/bin/x86_64-linux-musl-ld
# rm -rf x86_64-linux-musl-cross.tgz


cd $(dirname $(readlink -f $0))
cd a01-hello
rm -rf target


echo '=== 构建 hello target x86_64-unknown-linux-musl'
# CARGO_TARGET_X86_64_UNKNOWN_LINUX_MUSL_LINKER=$HOME/.local/share/musl/x86_64-linux-musl-cross/bin/x86_64-linux-musl-ld cargo build --target x86_64-unknown-linux-musl
cargo build --target x86_64-unknown-linux-musl --config "target.x86_64-unknown-linux-musl.linker='$HOME/.local/share/musl/x86_64-linux-musl-cross/bin/x86_64-linux-musl-ld'"
echo '--- 执行产物'
target/x86_64-unknown-linux-musl/debug/a01-hello
echo '--- ldd 查看产物'
ldd target/x86_64-unknown-linux-musl/debug/a01-hello
echo '--- readelf 查看产物版本'
readelf --version-info target/x86_64-unknown-linux-musl/debug/a01-hello

