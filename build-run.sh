#!/bin/sh

set -eux

# need to define CLANG_NEW

clang_old="${CLANG_OLD:-clang}"
clang_new="$CLANG_NEW"
mkdir -p bins

gcc test-i128-callee.c -fpic -c -o bins/callee-gcc.a
$clang_old test-i128-callee.c -fpic -c -o bins/callee-clang-old.a
$CLANG_NEW test-i128-callee.c -fpic -c -o bins/callee-clang-new.a

gcc test-i128.c bins/callee-gcc.a -o bins/caller-gcc-callee-gcc
gcc test-i128.c bins/callee-clang-old.a -o bins/caller-gcc-callee-clang-old
gcc test-i128.c bins/callee-clang-new.a -o bins/caller-gcc-callee-clang-new
$clang_old test-i128.c bins/callee-gcc.a -o bins/caller-clang-old-callee-gcc
$clang_old test-i128.c bins/callee-clang-old.a -o bins/caller-clang-old-callee-clang-old
$clang_old test-i128.c bins/callee-clang-new.a -o bins/caller-clang-old-callee-clang-new
$clang_new test-i128.c bins/callee-gcc.a -o bins/caller-clang-new-callee-gcc
$clang_new test-i128.c bins/callee-clang-old.a -o bins/caller-clang-new-callee-clang-old
$clang_new test-i128.c bins/callee-clang-new.a -o bins/caller-clang-new-callee-clang-new

./bins/caller-gcc-callee-gcc
./bins/caller-gcc-callee-clang-old
./bins/caller-gcc-callee-clang-new
./bins/caller-clang-old-callee-gcc
./bins/caller-clang-old-callee-clang-old
./bins/caller-clang-old-callee-clang-new
./bins/caller-clang-new-callee-gcc
./bins/caller-clang-new-callee-clang-old
./bins/caller-clang-new-callee-clang-new
