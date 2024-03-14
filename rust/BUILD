load("@rules_rust//rust:defs.bzl", "rust_library", "rust_test")
load("//rules:rust.bzl", "cargo_crate")

rust_library(
    name = "rust_example",
    srcs = ["lib.rs"],
)

rust_test(
    name = "rust_example_test",
    crate = ":rust_example",
    deps = [
        
        cargo_crate("gdal"),
    ],
)
