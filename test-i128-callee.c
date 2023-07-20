#include <inttypes.h>
#include <stdio.h>
;

void print_u128(__int128_t val) {
    int64_t upper = (int64_t)(val >> 64);
    int64_t lower = (int64_t)(val & 0xffffffffffffffff);
    printf("%#016lx%016lx", upper, lower);
}

void print_cc_version_callee() {
#ifdef __clang_version__
    printf("callee cc: clang %s\n", __clang_version__);
#else
    printf("callee cc: gcc %d.%d.%d\n", __GNUC__, __GNUC_MINOR__, __GNUC_PATCHLEVEL__);
#endif
}

void test_callee(
    uint8_t arg0,
    __int128_t arg1,
    __int128_t arg2,
    __int128_t arg3,
    __int128_t arg4,
    float arg15
) {
    print_cc_version_callee();
    printf("callee arg0 %d", arg0);
    printf("\ncallee arg1 ");
    print_u128(arg1);
    printf("\ncallee arg2 ");
    print_u128(arg2);
    printf("\ncallee arg3 ");
    print_u128(arg3);
    printf("\ncallee arg4 ");
    print_u128(arg4);
    printf("\ncallee arg15 %f\n", arg15);
}
