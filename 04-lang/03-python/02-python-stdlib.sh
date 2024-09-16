#!/usr/bin/env bash


echo '=== 观察 python 标准库情况'
python3 -c 'import os
pid = os.getpid()
print("--- 通过 /proc/%d/maps 查看动态库情况" % pid)
os.system("cat /proc/%d/maps | grep .so" % pid)
import ssl
import json
print("--- 导入 ssl 和 json 后 通过 /proc/%d/maps 查看动态库情况" % pid)
os.system("cat /proc/%d/maps | grep .so" % pid)
'
echo '---  通过 ldd 查看 _ssl.cpython-311-x86_64-linux-gnu.so 情况'
ldd /usr/lib/python3.11/lib-dynload/_ssl.cpython-311-x86_64-linux-gnu.so
