#!/usr/bin/env bash


echo '=== 观察 rustc 情况'
echo '--- 查看 rustc 版本'
rustc -V
echo '--- 查看 rustc 的动态库依赖'
ldd $(which rustc)
echo '--- 查看 rustc 的 glibc 依赖情况'
readelf --version-info $(which rustc)
