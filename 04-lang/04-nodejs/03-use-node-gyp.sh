#!/usr/bin/env bash


cd $(dirname $(readlink -f $0))
cd a01-use-node-gyp

echo '=== 查看 pty.node'
file node_modules/node-pty/build/Release/pty.node

export PATH=$PATH:~/.local/share/nodejs/node-v20.17.0-linux-x64/bin
npm install
node index.js

