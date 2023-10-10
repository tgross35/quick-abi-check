#!/bin/sh

set -eux

# need to define CLANG_NEW

run_f128=${SKIP_F128:-}
clang_old="${CLANG_OLD:-clang}"
clang_new="$CLANG_NEW"
rustc="$RUSTC"
mkdir -p bins

gcc test-i128-callee.c -fpic -c -o bins/i128-callee-gcc.a
gcc test-f128-callee.c -fpic -c -o bins/f128-callee-gcc.a
$clang_old test-i128-callee.c -fpic -c -o bins/i128-callee-clang-old.a
$clang_old test-f128-callee.c -fpic -c -o bins/f128-callee-clang-old.a
$clang_new test-i128-callee.c -fpic -c -o bins/i128-callee-clang-new.a
$clang_new test-f128-callee.c -fpic -c -o bins/f128-callee-clang-new.a
$rustc test-i128-callee.rs --crate-type=staticlib -o bins/i128-callee-rustc.a


gcc test-i128-caller.c bins/i128-callee-gcc.a -o bins/i128-caller-gcc-callee-gcc
gcc test-f128-caller.c bins/f128-callee-gcc.a -o bins/f128-caller-gcc-callee-gcc
gcc test-i128-caller.c bins/i128-callee-clang-old.a -o bins/i128-caller-gcc-callee-clang-old
gcc test-f128-caller.c bins/f128-callee-clang-old.a -o bins/f128-caller-gcc-callee-clang-old
gcc test-i128-caller.c bins/i128-callee-clang-new.a -o bins/i128-caller-gcc-callee-clang-new
gcc test-f128-caller.c bins/f128-callee-clang-new.a -o bins/f128-caller-gcc-callee-clang-new
gcc test-i128-caller.c bins/i128-callee-rustc.a -o bins/i128-caller-gcc-callee-rustc

$clang_old test-i128-caller.c bins/i128-callee-gcc.a -o bins/i128-caller-clang-old-callee-gcc
$clang_old test-f128-caller.c bins/f128-callee-gcc.a -o bins/f128-caller-clang-old-callee-gcc
$clang_old test-i128-caller.c bins/i128-callee-clang-old.a -o bins/i128-caller-clang-old-callee-clang-old
$clang_old test-f128-caller.c bins/f128-callee-clang-old.a -o bins/f128-caller-clang-old-callee-clang-old
$clang_old test-i128-caller.c bins/i128-callee-clang-new.a -o bins/i128-caller-clang-old-callee-clang-new
$clang_old test-f128-caller.c bins/f128-callee-clang-new.a -o bins/f128-caller-clang-old-callee-clang-new
$clang_old test-i128-caller.c bins/i128-callee-rustc.a -o bins/i128-caller-clang-old-callee-rustc

$clang_new test-i128-caller.c bins/i128-callee-gcc.a -o bins/i128-caller-clang-new-callee-gcc
$clang_new test-f128-caller.c bins/f128-callee-gcc.a -o bins/f128-caller-clang-new-callee-gcc
$clang_new test-i128-caller.c bins/i128-callee-clang-old.a -o bins/i128-caller-clang-new-callee-clang-old
$clang_new test-f128-caller.c bins/f128-callee-clang-old.a -o bins/f128-caller-clang-new-callee-clang-old
$clang_new test-i128-caller.c bins/i128-callee-clang-new.a -o bins/i128-caller-clang-new-callee-clang-new
$clang_new test-f128-caller.c bins/f128-callee-clang-new.a -o bins/f128-caller-clang-new-callee-clang-new
$clang_new test-i128-caller.c bins/i128-callee-rustc.a -o bins/i128-caller-clang-new-callee-rustc

$rustc test-i128-caller.rs -Clink-arg=bins/i128-callee-gcc.a -o bins/i128-caller-rustc-callee-gcc
$rustc test-i128-caller.rs -Clink-arg=bins/i128-callee-clang-old.a -o bins/i128-caller-rustc-callee-clang-old
$rustc test-i128-caller.rs -Clink-arg=bins/i128-callee-clang-new.a -o bins/i128-caller-rustc-callee-clang-new
$rustc test-i128-caller.rs -Clink-arg=bins/i128-callee-rustc.a -o bins/i128-caller-rustc-callee-rustc


echo i128 outputs:
./bins/i128-caller-gcc-callee-gcc
./bins/i128-caller-gcc-callee-clang-old
./bins/i128-caller-gcc-callee-clang-new
./bins/i128-caller-gcc-callee-rustc
./bins/i128-caller-clang-old-callee-gcc
./bins/i128-caller-clang-old-callee-clang-old
./bins/i128-caller-clang-old-callee-clang-new
./bins/i128-caller-clang-old-callee-rustc
./bins/i128-caller-clang-new-callee-gcc
./bins/i128-caller-clang-new-callee-clang-old
./bins/i128-caller-clang-new-callee-clang-new
./bins/i128-caller-clang-new-callee-clang-new
./bins/i128-caller-clang-new-callee-rustc
./bins/i128-caller-rustc-callee-gcc
./bins/i128-caller-rustc-callee-clang-old
./bins/i128-caller-rustc-callee-clang-new
./bins/i128-caller-rustc-callee-rustc

if [ -z "$run_f128" ]; then
    echo f128 outputs
    ./bins/f128-caller-gcc-callee-gcc
    ./bins/f128-caller-gcc-callee-clang-old
    ./bins/f128-caller-gcc-callee-clang-new
    ./bins/f128-caller-clang-old-callee-gcc
    ./bins/f128-caller-clang-old-callee-clang-old
    ./bins/f128-caller-clang-old-callee-clang-new
    ./bins/f128-caller-clang-new-callee-gcc
    ./bins/f128-caller-clang-new-callee-clang-old
    ./bins/f128-caller-clang-new-callee-clang-new
fi
