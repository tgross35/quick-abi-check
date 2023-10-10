Compare i128 caller/calle ABIs

```
CLANG_NEW=path/to/built/clang RUSTC=path/to/built/rust ./build-run.sh
```

## Output with D86310 and D158169

Both rusc and clang-new is built with <https://reviews.llvm.org/D86310> and
<https://reviews.llvm.org/D158169>, Note how gcc and old clang disagree on
output for arg3+ on i128 (but f128 is fine), but gcc and new clang always agree.

```
i128 outputs:
+ ./bins/i128-caller-gcc-callee-gcc
caller cc: gcc 11.4.0
callee cc: gcc 11.4.0
caller align i128 16
caller arg0 244
caller argval 0xf0e0d0c0b0a09080706050403020100
caller arg15 123456.125000
end caller
callee align i128 16
callee arg0 244
callee arg1 0xf0e0d0c0b0a09080706050403020100
callee arg2 0xf0e0d0c0b0a09080706050403020100
callee arg3 0xf0e0d0c0b0a09080706050403020100
callee arg4 0xf0e0d0c0b0a09080706050403020100
callee arg15 123456.125000
+ ./bins/i128-caller-gcc-callee-clang-old
caller cc: gcc 11.4.0
callee cc: clang 14.0.0
caller align i128 16
caller arg0 244
caller argval 0xf0e0d0c0b0a09080706050403020100
caller arg15 123456.125000
end caller
callee align i128 16
callee arg0 244
callee arg1 0xf0e0d0c0b0a09080706050403020100
callee arg2 0xf0e0d0c0b0a09080706050403020100
callee arg3 0x7060504030201000000000000000000
callee arg4 0x7060504030201000f0e0d0c0b0a0908
callee arg15 123456.125000
+ ./bins/i128-caller-gcc-callee-clang-new
caller cc: gcc 11.4.0
callee cc: clang 18.0.0 (git@github.com:tgross35/llvm-project.git b9499189a2554e289250d1ef4fe96d068e3ed3bd)
caller align i128 16
caller arg0 244
caller argval 0xf0e0d0c0b0a09080706050403020100
caller arg15 123456.125000
end caller
callee align i128 16
callee arg0 244
callee arg1 0xf0e0d0c0b0a09080706050403020100
callee arg2 0xf0e0d0c0b0a09080706050403020100
callee arg3 0xf0e0d0c0b0a09080706050403020100
callee arg4 0xf0e0d0c0b0a09080706050403020100
callee arg15 123456.125000
+ ./bins/i128-caller-gcc-callee-rustc
caller cc: gcc 11.4.0
caller rustc: version unspecified
caller align i128 16
caller arg0 244
caller argval 0x0f0e0d0c0b0a09080706050403020100
caller arg15 123456.125000
end caller
callee align i128 16
callee arg0 244
callee arg1 0x0f0e0d0c0b0a09080706050403020100
callee arg2 0x0f0e0d0c0b0a09080706050403020100
callee arg3 0x0f0e0d0c0b0a09080706050403020100
callee arg4 0x0f0e0d0c0b0a09080706050403020100
callee arg15 123456.125
+ ./bins/i128-caller-clang-old-callee-gcc
caller cc: clang 14.0.0
callee cc: gcc 11.4.0
caller align i128 16
caller arg0 244
caller argval 0xf0e0d0c0b0a09080706050403020100
caller arg15 123456.125000
end caller
callee align i128 16
callee arg0 244
callee arg1 0xf0e0d0c0b0a09080706050403020100
callee arg2 0xf0e0d0c0b0a09080706050403020100
callee arg3 0x7060504030201000f0e0d0c0b0a0908
callee arg4 00000000000000000f0e0d0c0b0a0908
callee arg15 123456.125000
+ ./bins/i128-caller-clang-old-callee-clang-old
caller cc: clang 14.0.0
callee cc: clang 14.0.0
caller align i128 16
caller arg0 244
caller argval 0xf0e0d0c0b0a09080706050403020100
caller arg15 123456.125000
end caller
callee align i128 16
callee arg0 244
callee arg1 0xf0e0d0c0b0a09080706050403020100
callee arg2 0xf0e0d0c0b0a09080706050403020100
callee arg3 0xf0e0d0c0b0a09080706050403020100
callee arg4 0xf0e0d0c0b0a09080706050403020100
callee arg15 123456.125000
+ ./bins/i128-caller-clang-old-callee-clang-new
caller cc: clang 14.0.0
callee cc: clang 18.0.0 (git@github.com:tgross35/llvm-project.git b9499189a2554e289250d1ef4fe96d068e3ed3bd)
caller align i128 16
caller arg0 244
caller argval 0xf0e0d0c0b0a09080706050403020100
caller arg15 123456.125000
end caller
callee align i128 16
callee arg0 244
callee arg1 0xf0e0d0c0b0a09080706050403020100
callee arg2 0xf0e0d0c0b0a09080706050403020100
callee arg3 0x7060504030201000f0e0d0c0b0a0908
callee arg4 00000000000000000f0e0d0c0b0a0908
callee arg15 123456.125000
+ ./bins/i128-caller-clang-old-callee-rustc
caller cc: clang 14.0.0
caller rustc: version unspecified
caller align i128 16
caller arg0 244
caller argval 0x0f0e0d0c0b0a09080706050403020100
caller arg15 123456.125000
end caller
callee align i128 16
callee arg0 244
callee arg1 0x0f0e0d0c0b0a09080706050403020100
callee arg2 0x0f0e0d0c0b0a09080706050403020100
callee arg3 0x07060504030201000f0e0d0c0b0a0908
callee arg4 0x00000000000000010f0e0d0c0b0a0908
callee arg15 123456.125
+ ./bins/i128-caller-clang-new-callee-gcc
caller cc: clang 18.0.0 (git@github.com:tgross35/llvm-project.git b9499189a2554e289250d1ef4fe96d068e3ed3bd)
callee cc: gcc 11.4.0
caller align i128 16
caller arg0 244
caller argval 0xf0e0d0c0b0a09080706050403020100
caller arg15 123456.125000
end caller
callee align i128 16
callee arg0 244
callee arg1 0xf0e0d0c0b0a09080706050403020100
callee arg2 0xf0e0d0c0b0a09080706050403020100
callee arg3 0xf0e0d0c0b0a09080706050403020100
callee arg4 0xf0e0d0c0b0a09080706050403020100
callee arg15 123456.125000
+ ./bins/i128-caller-clang-new-callee-clang-old
caller cc: clang 18.0.0 (git@github.com:tgross35/llvm-project.git b9499189a2554e289250d1ef4fe96d068e3ed3bd)
callee cc: clang 14.0.0
caller align i128 16
caller arg0 244
caller argval 0xf0e0d0c0b0a09080706050403020100
caller arg15 123456.125000
end caller
callee align i128 16
callee arg0 244
callee arg1 0xf0e0d0c0b0a09080706050403020100
callee arg2 0xf0e0d0c0b0a09080706050403020100
callee arg3 0x7060504030201000706050403020100
callee arg4 0x7060504030201000f0e0d0c0b0a0908
callee arg15 123456.125000
+ ./bins/i128-caller-clang-new-callee-clang-new
caller cc: clang 18.0.0 (git@github.com:tgross35/llvm-project.git b9499189a2554e289250d1ef4fe96d068e3ed3bd)
callee cc: clang 18.0.0 (git@github.com:tgross35/llvm-project.git b9499189a2554e289250d1ef4fe96d068e3ed3bd)
caller align i128 16
caller arg0 244
caller argval 0xf0e0d0c0b0a09080706050403020100
caller arg15 123456.125000
end caller
callee align i128 16
callee arg0 244
callee arg1 0xf0e0d0c0b0a09080706050403020100
callee arg2 0xf0e0d0c0b0a09080706050403020100
callee arg3 0xf0e0d0c0b0a09080706050403020100
callee arg4 0xf0e0d0c0b0a09080706050403020100
callee arg15 123456.125000
+ ./bins/i128-caller-clang-new-callee-clang-new
caller cc: clang 18.0.0 (git@github.com:tgross35/llvm-project.git b9499189a2554e289250d1ef4fe96d068e3ed3bd)
callee cc: clang 18.0.0 (git@github.com:tgross35/llvm-project.git b9499189a2554e289250d1ef4fe96d068e3ed3bd)
caller align i128 16
caller arg0 244
caller argval 0xf0e0d0c0b0a09080706050403020100
caller arg15 123456.125000
end caller
callee align i128 16
callee arg0 244
callee arg1 0xf0e0d0c0b0a09080706050403020100
callee arg2 0xf0e0d0c0b0a09080706050403020100
callee arg3 0xf0e0d0c0b0a09080706050403020100
callee arg4 0xf0e0d0c0b0a09080706050403020100
callee arg15 123456.125000
+ ./bins/i128-caller-clang-new-callee-rustc
caller cc: clang 18.0.0 (git@github.com:tgross35/llvm-project.git b9499189a2554e289250d1ef4fe96d068e3ed3bd)
caller rustc: version unspecified
caller align i128 16
caller arg0 244
caller argval 0x0f0e0d0c0b0a09080706050403020100
caller arg15 123456.125000
end caller
callee align i128 16
callee arg0 244
callee arg1 0x0f0e0d0c0b0a09080706050403020100
callee arg2 0x0f0e0d0c0b0a09080706050403020100
callee arg3 0x0f0e0d0c0b0a09080706050403020100
callee arg4 0x0f0e0d0c0b0a09080706050403020100
callee arg15 123456.125
+ ./bins/i128-caller-rustc-callee-gcc
caller rustc: version unspecified
callee cc: gcc 11.4.0
caller align i128 16
caller arg0 244
caller argval 0x0f0e0d0c0b0a09080706050403020100
caller arg15 123456.125
callee align i128 16
callee arg0 244
callee arg1 0xf0e0d0c0b0a09080706050403020100
callee arg2 0xf0e0d0c0b0a09080706050403020100
callee arg3 0xf0e0d0c0b0a09080706050403020100
callee arg4 0xf0e0d0c0b0a09080706050403020100
callee arg15 123456.125000
+ ./bins/i128-caller-rustc-callee-clang-old
caller rustc: version unspecified
callee cc: clang 14.0.0
caller align i128 16
caller arg0 244
caller argval 0x0f0e0d0c0b0a09080706050403020100
caller arg15 123456.125
callee align i128 16
callee arg0 244
callee arg1 0xf0e0d0c0b0a09080706050403020100
callee arg2 0xf0e0d0c0b0a09080706050403020100
callee arg3 0x7060504030201000706050403020100
callee arg4 0x7060504030201000f0e0d0c0b0a0908
callee arg15 123456.125000
+ ./bins/i128-caller-rustc-callee-clang-new
caller rustc: version unspecified
callee cc: clang 18.0.0 (git@github.com:tgross35/llvm-project.git b9499189a2554e289250d1ef4fe96d068e3ed3bd)
caller align i128 16
caller arg0 244
caller argval 0x0f0e0d0c0b0a09080706050403020100
caller arg15 123456.125
callee align i128 16
callee arg0 244
callee arg1 0xf0e0d0c0b0a09080706050403020100
callee arg2 0xf0e0d0c0b0a09080706050403020100
callee arg3 0xf0e0d0c0b0a09080706050403020100
callee arg4 0xf0e0d0c0b0a09080706050403020100
callee arg15 123456.125000
+ ./bins/i128-caller-rustc-callee-rustc
caller rustc: version unspecified
caller rustc: version unspecified
caller align i128 16
caller arg0 244
caller argval 0x0f0e0d0c0b0a09080706050403020100
caller arg15 123456.125
callee align i128 16
callee arg0 244
callee arg1 0x0f0e0d0c0b0a09080706050403020100
callee arg2 0x0f0e0d0c0b0a09080706050403020100
callee arg3 0x0f0e0d0c0b0a09080706050403020100
callee arg4 0x0f0e0d0c0b0a09080706050403020100
callee arg15 123456.125
+ [ -z  ]
+ echo f128 outputs
f128 outputs
+ ./bins/f128-caller-gcc-callee-gcc
caller cc: gcc 11.4.0
callee cc: gcc 11.4.0
caller align f128 16
caller arg0 244
caller argval 0000000c088392a7ffc02d40
caller arg15 123456.125000
callee arg0 244
callee arg1 0000000c088392a7ffc02d40
callee arg2 0000000c088392a7ffc02d40
callee arg3 0000000c088392a7ffc02d40
callee arg4 0000000c088392a7ffc02d40
callee arg15 123456.125000
+ ./bins/f128-caller-gcc-callee-clang-old
caller cc: gcc 11.4.0
callee cc: clang 14.0.0
caller align f128 16
caller arg0 244
caller argval 0000000c088392a7ffc02d40
caller arg15 123456.125000
callee arg0 244
callee arg1 0000000c088392a7ffc02d40
callee arg2 0000000c088392a7ffc02d40
callee arg3 0000000c088392a7ffc02d40
callee arg4 0000000c088392a7ffc02d40
callee arg15 123456.125000
+ ./bins/f128-caller-gcc-callee-clang-new
caller cc: gcc 11.4.0
callee cc: clang 18.0.0 (git@github.com:tgross35/llvm-project.git b9499189a2554e289250d1ef4fe96d068e3ed3bd)
caller align f128 16
caller arg0 244
caller argval 0000000c088392a7ffc02d40
caller arg15 123456.125000
callee arg0 244
callee arg1 0000000c088392a7ffc02d40
callee arg2 0000000c088392a7ffc02d40
callee arg3 0000000c088392a7ffc02d40
callee arg4 0000000c088392a7ffc02d40
callee arg15 123456.125000
+ ./bins/f128-caller-clang-old-callee-gcc
caller cc: clang 14.0.0
callee cc: gcc 11.4.0
caller align f128 16
caller arg0 244
caller argval 0000000c088392a7ffc02d40
caller arg15 123456.125000
callee arg0 244
callee arg1 0000000c088392a7ffc02d40
callee arg2 0000000c088392a7ffc02d40
callee arg3 0000000c088392a7ffc02d40
callee arg4 0000000c088392a7ffc02d40
callee arg15 123456.125000
+ ./bins/f128-caller-clang-old-callee-clang-old
caller cc: clang 14.0.0
callee cc: clang 14.0.0
caller align f128 16
caller arg0 244
caller argval 0000000c088392a7ffc02d40
caller arg15 123456.125000
callee arg0 244
callee arg1 0000000c088392a7ffc02d40
callee arg2 0000000c088392a7ffc02d40
callee arg3 0000000c088392a7ffc02d40
callee arg4 0000000c088392a7ffc02d40
callee arg15 123456.125000
+ ./bins/f128-caller-clang-old-callee-clang-new
caller cc: clang 14.0.0
callee cc: clang 18.0.0 (git@github.com:tgross35/llvm-project.git b9499189a2554e289250d1ef4fe96d068e3ed3bd)
caller align f128 16
caller arg0 244
caller argval 0000000c088392a7ffc02d40
caller arg15 123456.125000
callee arg0 244
callee arg1 0000000c088392a7ffc02d40
callee arg2 0000000c088392a7ffc02d40
callee arg3 0000000c088392a7ffc02d40
callee arg4 0000000c088392a7ffc02d40
callee arg15 123456.125000
+ ./bins/f128-caller-clang-new-callee-gcc
caller cc: clang 18.0.0 (git@github.com:tgross35/llvm-project.git b9499189a2554e289250d1ef4fe96d068e3ed3bd)
callee cc: gcc 11.4.0
caller align f128 16
caller arg0 244
caller argval 0000000c088392a7ffc02d40
caller arg15 123456.125000
callee arg0 244
callee arg1 0000000c088392a7ffc02d40
callee arg2 0000000c088392a7ffc02d40
callee arg3 0000000c088392a7ffc02d40
callee arg4 0000000c088392a7ffc02d40
callee arg15 123456.125000
+ ./bins/f128-caller-clang-new-callee-clang-old
caller cc: clang 18.0.0 (git@github.com:tgross35/llvm-project.git b9499189a2554e289250d1ef4fe96d068e3ed3bd)
callee cc: clang 14.0.0
caller align f128 16
caller arg0 244
caller argval 0000000c088392a7ffc02d40
caller arg15 123456.125000
callee arg0 244
callee arg1 0000000c088392a7ffc02d40
callee arg2 0000000c088392a7ffc02d40
callee arg3 0000000c088392a7ffc02d40
callee arg4 0000000c088392a7ffc02d40
callee arg15 123456.125000
+ ./bins/f128-caller-clang-new-callee-clang-new
caller cc: clang 18.0.0 (git@github.com:tgross35/llvm-project.git b9499189a2554e289250d1ef4fe96d068e3ed3bd)
callee cc: clang 18.0.0 (git@github.com:tgross35/llvm-project.git b9499189a2554e289250d1ef4fe96d068e3ed3bd)
caller align f128 16
caller arg0 244
caller argval 0000000c088392a7ffc02d40
caller arg15 123456.125000
callee arg0 244
callee arg1 0000000c088392a7ffc02d40
callee arg2 0000000c088392a7ffc02d40
callee arg3 0000000c088392a7ffc02d40
callee arg4 0000000c088392a7ffc02d40
callee arg15 123456.125000
```

## Output with only D86310

clang-new is built with the patch from <https://reviews.llvm.org/D86310>. Note
how gcc and clang disagree on output for arg3+ on i128 (but f128 is fine).

```
i128 outputs
caller cc: gcc 11.3.0
caller align i128 16
caller arg0 244
caller argval 0xf0e0d0c0b0a09080706050403020100
caller arg15 123456.125000
callee cc: gcc 11.3.0
callee arg0 244
callee arg1 0xf0e0d0c0b0a09080706050403020100
callee arg2 0xf0e0d0c0b0a09080706050403020100
callee arg3 0xf0e0d0c0b0a09080706050403020100
callee arg4 0xf0e0d0c0b0a09080706050403020100
callee arg15 123456.125000

caller cc: gcc 11.3.0
caller align i128 16
caller arg0 244
caller argval 0xf0e0d0c0b0a09080706050403020100
caller arg15 123456.125000
callee cc: clang 14.0.0 
callee arg0 244
callee arg1 0xf0e0d0c0b0a09080706050403020100
callee arg2 0xf0e0d0c0b0a09080706050403020100
callee arg3 0x7060504030201000000000000000000
callee arg4 0x7060504030201000f0e0d0c0b0a0908
callee arg15 123456.125000

caller cc: gcc 11.3.0
caller align i128 16
caller arg0 244
caller argval 0xf0e0d0c0b0a09080706050403020100
caller arg15 123456.125000
callee cc: clang 17.0.0 (git@github.com:tgross35/llvm-project.git 1733d949633a61cd0213f63e22d461a39e798946)
callee arg0 244
callee arg1 0xf0e0d0c0b0a09080706050403020100
callee arg2 0xf0e0d0c0b0a09080706050403020100
callee arg3 0x7060504030201000000000000000000
callee arg4 0x7060504030201000f0e0d0c0b0a0908
callee arg15 123456.125000

caller cc: clang 14.0.0 
caller align i128 16
caller arg0 244
caller argval 0xf0e0d0c0b0a09080706050403020100
caller arg15 123456.125000
callee cc: gcc 11.3.0
callee arg0 244
callee arg1 0xf0e0d0c0b0a09080706050403020100
callee arg2 0xf0e0d0c0b0a09080706050403020100
callee arg3 0x7060504030201000f0e0d0c0b0a0908
callee arg4 0x000000000000010f0e0d0c0b0a0908
callee arg15 123456.125000

caller cc: clang 14.0.0 
caller align i128 16
caller arg0 244
caller argval 0xf0e0d0c0b0a09080706050403020100
caller arg15 123456.125000
callee cc: clang 14.0.0 
callee arg0 244
callee arg1 0xf0e0d0c0b0a09080706050403020100
callee arg2 0xf0e0d0c0b0a09080706050403020100
callee arg3 0xf0e0d0c0b0a09080706050403020100
callee arg4 0xf0e0d0c0b0a09080706050403020100
callee arg15 123456.125000

caller cc: clang 14.0.0 
caller align i128 16
caller arg0 244
caller argval 0xf0e0d0c0b0a09080706050403020100
caller arg15 123456.125000
callee cc: clang 17.0.0 (git@github.com:tgross35/llvm-project.git 1733d949633a61cd0213f63e22d461a39e798946)
callee arg0 244
callee arg1 0xf0e0d0c0b0a09080706050403020100
callee arg2 0xf0e0d0c0b0a09080706050403020100
callee arg3 0xf0e0d0c0b0a09080706050403020100
callee arg4 0xf0e0d0c0b0a09080706050403020100
callee arg15 123456.125000
caller cc: clang 17.0.0 (git@github.com:tgross35/llvm-project.git 1733d949633a61cd0213f63e22d461a39e798946)
caller align i128 16
caller arg0 244
caller argval 0xf0e0d0c0b0a09080706050403020100
caller arg15 123456.125000

callee cc: gcc 11.3.0
callee arg0 244
callee arg1 0xf0e0d0c0b0a09080706050403020100
callee arg2 0xf0e0d0c0b0a09080706050403020100
callee arg3 0x7060504030201000f0e0d0c0b0a0908
callee arg4 0x000000000000010f0e0d0c0b0a0908
callee arg15 123456.125000
caller cc: clang 17.0.0 (git@github.com:tgross35/llvm-project.git 1733d949633a61cd0213f63e22d461a39e798946)
caller align i128 16
caller arg0 244
caller argval 0xf0e0d0c0b0a09080706050403020100
caller arg15 123456.125000
callee cc: clang 14.0.0 
callee arg0 244
callee arg1 0xf0e0d0c0b0a09080706050403020100
callee arg2 0xf0e0d0c0b0a09080706050403020100
callee arg3 0xf0e0d0c0b0a09080706050403020100
callee arg4 0xf0e0d0c0b0a09080706050403020100
callee arg15 123456.125000

caller cc: clang 17.0.0 (git@github.com:tgross35/llvm-project.git 1733d949633a61cd0213f63e22d461a39e798946)
caller align i128 16
caller arg0 244
caller argval 0xf0e0d0c0b0a09080706050403020100
caller arg15 123456.125000
callee cc: clang 17.0.0 (git@github.com:tgross35/llvm-project.git 1733d949633a61cd0213f63e22d461a39e798946)
callee arg0 244
callee arg1 0xf0e0d0c0b0a09080706050403020100
callee arg2 0xf0e0d0c0b0a09080706050403020100
callee arg3 0xf0e0d0c0b0a09080706050403020100
callee arg4 0xf0e0d0c0b0a09080706050403020100
callee arg15 123456.125000

f128 outputs
caller cc: gcc 11.3.0
caller align f128 16
caller arg0 244
caller argval 0000000c088392a7ffc02d40
caller arg15 123456.125000
callee cc: gcc 11.3.0
callee arg0 244
callee arg1 0000000c088392a7ffc02d40
callee arg2 0000000c088392a7ffc02d40
callee arg3 0000000c088392a7ffc02d40
callee arg4 0000000c088392a7ffc02d40
callee arg15 123456.125000

caller cc: gcc 11.3.0
caller align f128 16
caller arg0 244
caller argval 0000000c088392a7ffc02d40
caller arg15 123456.125000
callee cc: clang 14.0.0
callee arg0 244
callee arg1 0000000c088392a7ffc02d40
callee arg2 0000000c088392a7ffc02d40
callee arg3 0000000c088392a7ffc02d40
callee arg4 0000000c088392a7ffc02d40
callee arg15 123456.125000

caller cc: gcc 11.3.0
caller align f128 16
caller arg0 244
caller argval 0000000c088392a7ffc02d40
caller arg15 123456.125000
callee cc: clang 14.0.0
callee arg0 244
callee arg1 0000000c088392a7ffc02d40
callee arg2 0000000c088392a7ffc02d40
callee arg3 0000000c088392a7ffc02d40
callee arg4 0000000c088392a7ffc02d40
callee arg15 123456.125000

caller cc: clang 14.0.0
caller align f128 16
caller arg0 244
caller argval 0000000c088392a7ffc02d40
caller arg15 123456.125000
callee cc: gcc 11.3.0
callee arg0 244
callee arg1 0000000c088392a7ffc02d40
callee arg2 0000000c088392a7ffc02d40
callee arg3 0000000c088392a7ffc02d40
callee arg4 0000000c088392a7ffc02d40
callee arg15 123456.125000

caller cc: clang 14.0.0
caller align f128 16
caller arg0 244
caller argval 0000000c088392a7ffc02d40
caller arg15 123456.125000
callee cc: clang 14.0.0
callee arg0 244
callee arg1 0000000c088392a7ffc02d40
callee arg2 0000000c088392a7ffc02d40
callee arg3 0000000c088392a7ffc02d40
callee arg4 0000000c088392a7ffc02d40
callee arg15 123456.125000

caller cc: clang 14.0.0
caller align f128 16
caller arg0 244
caller argval 0000000c088392a7ffc02d40
caller arg15 123456.125000
callee cc: clang 14.0.0
callee arg0 244
callee arg1 0000000c088392a7ffc02d40
callee arg2 0000000c088392a7ffc02d40
callee arg3 0000000c088392a7ffc02d40
callee arg4 0000000c088392a7ffc02d40
callee arg15 123456.125000

caller cc: clang 14.0.0
caller align f128 16
caller arg0 244
caller argval 0000000c088392a7ffc02d40
caller arg15 123456.125000
callee cc: gcc 11.3.0
callee arg0 244
callee arg1 0000000c088392a7ffc02d40
callee arg2 0000000c088392a7ffc02d40
callee arg3 0000000c088392a7ffc02d40
callee arg4 0000000c088392a7ffc02d40
callee arg15 123456.125000

caller cc: clang 14.0.0
caller align f128 16
caller arg0 244
caller argval 0000000c088392a7ffc02d40
caller arg15 123456.125000
callee cc: clang 14.0.0
callee arg0 244
callee arg1 0000000c088392a7ffc02d40
callee arg2 0000000c088392a7ffc02d40
callee arg3 0000000c088392a7ffc02d40
callee arg4 0000000c088392a7ffc02d40
callee arg15 123456.125000

caller cc: clang 14.0.0
caller align f128 16
caller arg0 244
caller argval 0000000c088392a7ffc02d40
caller arg15 123456.125000
callee cc: clang 14.0.0
callee arg0 244
callee arg1 0000000c088392a7ffc02d40
callee arg2 0000000c088392a7ffc02d40
callee arg3 0000000c088392a7ffc02d40
callee arg4 0000000c088392a7ffc02d40
callee arg15 123456.125000
```

