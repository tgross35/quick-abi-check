#include <inttypes.h>
#include <stdio.h>
;

void print_f128(__float128 val) {
    uint8_t *arr = (uint8_t*)(&val);

    for (int i=0; i<16; ++i) {
        printf("%x", arr[i]);
    }
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
    __float128 arg1,
    __float128 arg2,
    __float128 arg3,
    __float128 arg4,
    float arg15
) {
    print_cc_version_callee();
    printf("callee arg0 %d", arg0);
    printf("\ncallee arg1 ");
    print_f128(arg1);
    printf("\ncallee arg2 ");
    print_f128(arg2);
    printf("\ncallee arg3 ");
    print_f128(arg3);
    printf("\ncallee arg4 ");
    print_f128(arg4);
    printf("\ncallee arg15 %f\n", arg15);
}
