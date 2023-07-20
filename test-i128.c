#include <inttypes.h>
#include <stdio.h>
;

void print_u128(__int128_t val);

void test_callee(
    uint8_t arg0,
    __int128_t arg1,
    __int128_t arg2,
    __int128_t arg3,
    __int128_t arg4,
    float arg15
);

void print_cc_version_caller() {
#ifdef __clang_version__
    printf("caller cc: clang %s\n", __clang_version__);
#else
    printf("caller cc: gcc %d.%d.%d\n", __GNUC__, __GNUC_MINOR__, __GNUC_PATCHLEVEL__);
#endif
}

int main() {
    __int128_t argval = (((__int128_t)0xF0E0D0C0B0A0908ull) << 64) | ((__int128_t)0x706050403020100ull);
    uint8_t arg0 = 0xf4;
    float lastarg = 123456.12345;

    print_cc_version_caller();
    printf("caller align i128 %lu\n", _Alignof(__int128_t));
    printf("caller arg0 %d", arg0);
    printf("\ncaller argval ");
    print_u128(argval);
    printf("\ncaller arg15 %f\n", lastarg);

    test_callee(
        arg0,
        argval,
        argval,
        argval,
        argval,
        lastarg
    );
}
