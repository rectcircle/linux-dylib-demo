#!/usr/bin/env bash


# 安装 Linux x64 官方版本
mkdir -p ~/.local/share/nodejs
cd ~/.local/share/nodejs
wget https://nodejs.org/dist/v20.17.0/node-v20.17.0-linux-x64.tar.xz -O node-v20.17.0-linux-x64.tar.xz
tar -xf node-v20.17.0-linux-x64.tar.xz
rm -rf node-v20.17.0-linux-x64.tar.xz
# 安装非官方版本 Linux x64 glibc 2.17
wget https://unofficial-builds.nodejs.org/download/release/v20.17.0/node-v20.17.0-linux-x64-glibc-217.tar.xz -O node-v20.17.0-linux-x64-glibc-217.tar.xz
tar -xf node-v20.17.0-linux-x64-glibc-217.tar.xz
rm -rf node-v20.17.0-linux-x64-glibc-217.tar.xz
# 安装非官方构建版本 Linux x64 musl
wget https://unofficial-builds.nodejs.org/download/release/v20.17.0/node-v20.17.0-linux-x64-musl.tar.xz -O node-v20.17.0-linux-x64-musl.tar.xz
tar -xf node-v20.17.0-linux-x64-musl.tar.xz
rm -rf node-v20.17.0-linux-x64-musl.tar.xz
