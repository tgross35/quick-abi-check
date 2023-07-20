Compare i128 caller/calle ABIs

```
CLANG_NEW=path/to/built/clang ./build-run.sh 
```

## Current output

clang-new is built with the patch from <https://reviews.llvm.org/D86310>. Note
how gcc and clang disagree on output for arg3+.

```
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
```
