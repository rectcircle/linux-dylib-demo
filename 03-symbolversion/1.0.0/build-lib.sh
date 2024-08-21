#!/usr/bin/env bash

# https://github.com/bminor/glibc/blob/master/string/Versions
# https://www.gnu.org/software/gnulib/manual/html_node/LD-Version-Scripts.html

cd $(dirname $(readlink -f $0))
cd ../
mkdir -p build/lib
rm -rf build/include

cp -rf ./include ./build
// TODO