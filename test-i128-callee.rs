#![allow(unused, improper_ctypes_definitions)]

use std::io::Write;

#[no_mangle]
extern "C" fn print_u128(val: i128) {
    print!("{val:#034x}");
    std::io::stdout().flush().unwrap();
}

#[no_mangle]
extern "C" fn print_cc_version_callee() {
    println!("caller rustc: version unspecified")
}

#[no_mangle]
extern "C" fn test_callee(arg0: u8, arg1: i128, arg2: i128, arg3: i128, arg4: i128, arg5: f32) {
    println!("callee align i128 {}", std::mem::align_of::<i128>());
    println!("callee arg0 {arg0}");
    print!("callee arg1 ");
    print_u128(arg1);
    print!("\ncallee arg2 ");
    print_u128(arg2);
    print!("\ncallee arg3 ");
    print_u128(arg3);
    print!("\ncallee arg4 ");
    print_u128(arg4);
    println!("\ncallee arg15 {arg5}");
}
