#![allow(unused, improper_ctypes)]

extern "C" {
    fn print_u128(val: i128);
    fn print_cc_version_callee();
    fn test_callee(arg0: u8, arg1: i128, arg2: i128, arg3: i128, arg4: i128, arg5: f32);
}

fn print_cc_version_caller() {
    println!("caller rustc: version unspecified")
}

fn main() {
    let argval: i128 = 0xf0e0d0c0b0a0908i128 << 64 | 0x706050403020100i128;
    let arg0: u8 = 0xf4;
    let lastarg: f32 = 123456.12345;

    print_cc_version_caller();
    unsafe { print_cc_version_callee() };

    println!("caller align i128 {}", std::mem::align_of::<i128>());
    println!("caller arg0 {arg0}");
    println!("caller argval {argval:#034x}");
    println!("caller arg15 {lastarg}");

    unsafe { test_callee(arg0, argval, argval, argval, argval, lastarg) };
}
