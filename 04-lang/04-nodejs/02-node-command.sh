#!/usr/bin/env bash

echo '=== 查看 node Linux x64 情况'
echo '--- 执行 node -v'
~/.local/share/nodejs/node-v20.17.0-linux-x64/bin/node -v
echo '--- lld 查看 node'
ldd ~/.local/share/nodejs/node-v20.17.0-linux-x64/bin/node
echo '--- readelf 查看 node 动态库'
readelf -d ~/.local/share/nodejs/node-v20.17.0-linux-x64/bin/node | grep so
echo '--- readelf 查看 node version'
readelf --version-info ~/.local/share/nodejs/node-v20.17.0-linux-x64/bin/node | grep -A 10000 '.gnu.version_r'
echo


echo '=== 查看 node Linux glibc 2.17 情况'
echo '--- 执行 node -v'
~/.local/share/nodejs/node-v20.17.0-linux-x64-glibc-217/bin/node -v
echo '--- lld 查看 node'
ldd ~/.local/share/nodejs/node-v20.17.0-linux-x64-glibc-217/bin/node
echo '--- readelf 查看 node 动态库'
readelf -d ~/.local/share/nodejs/node-v20.17.0-linux-x64-glibc-217/bin/node | grep so
echo '--- readelf 查看 node version'
readelf --version-info ~/.local/share/nodejs/node-v20.17.0-linux-x64-glibc-217/bin/node | grep -A 10000 '.gnu.version_r'
echo


echo '=== 查看 node Linux musl 情况'
echo '--- 执行 node -v'
~/.local/share/nodejs/node-v20.17.0-linux-x64-musl/bin/node -v
echo '--- lld 查看 node'
ldd ~/.local/share/nodejs/node-v20.17.0-linux-x64-musl/bin/node
echo '--- readelf 查看 node 动态库'
readelf -d ~/.local/share/nodejs/node-v20.17.0-linux-x64-musl/bin/node | grep so
echo '--- readelf 查看 node version'
readelf --version-info ~/.local/share/nodejs/node-v20.17.0-linux-x64-musl/bin/node | grep -A 10000 '.gnu.version_r'
echo
