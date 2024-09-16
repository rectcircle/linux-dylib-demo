#!/usr/bin/env bash


echo '=== 观察 python 解释器情况'
echo '--- 使用 ldd 查看'
ldd $(which python3)
