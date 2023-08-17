#include <inttypes.h>
#include <stdio.h>

void print_f128(__float128 val);
void print_cc_version_callee();

void test_callee(
    uint8_t arg0,
    __float128 arg1,
    __float128 arg2,
    __float128 arg3,
    __float128 arg4,
    float arg15);

void print_cc_version_caller()
{
#ifdef __clang_version__
    printf("caller cc: clang %s\n", __clang_version__);
#else
    printf("caller cc: gcc %d.%d.%d\n", __GNUC__, __GNUC_MINOR__, __GNUC_PATCHLEVEL__);
#endif
}

int main()
{
    __float128 argval = 123419809317090.1892739847;
    uint8_t arg0 = 0xf4;
    float lastarg = 123456.12345;

    print_cc_version_caller();
    print_cc_version_callee();

    printf("caller align f128 %lu\n", _Alignof(__float128));
    printf("caller arg0 %d", arg0);
    printf("\ncaller argval ");
    print_f128(argval);
    printf("\ncaller arg15 %f\n", lastarg);

    test_callee(
        arg0,
        argval,
        argval,
        argval,
        argval,
        lastarg);
}
