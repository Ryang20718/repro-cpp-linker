load("@bazel_tools//tools/cpp:unix_cc_toolchain_config.bzl", "cc_toolchain_config")
load("@rules_cc//cc:defs.bzl", "cc_toolchain")

# based on auto-generated @local_config_cc/BUILD and adapted to use newer cc_toolchain_config from @bazel_tools rather than rules_cc
# refer to https://github.com/bazelbuild/bazel/blob/master/tools/cpp/unix_cc_toolchain_config.bzl for argument reference

package(default_visibility = ["//visibility:public"])

filegroup(
    name = "empty",
    srcs = [],
)

cc_toolchain(
    name = "cc_compiler_k8",  # TODO: rename to x86_64 for clarity
    all_files = ":empty",
    ar_files = ":empty",
    as_files = ":empty",
    compiler_files = ":empty",
    dwp_files = ":empty",
    linker_files = ":empty",
    objcopy_files = ":empty",
    strip_files = ":empty",
    supports_param_files = 1,
    toolchain_config = ":local",
    toolchain_identifier = "local",  # TODO: rename
)

cc_toolchain_config(
    name = "local",
    abi_libc_version = "local",  # TODO: can be None or set to glibc version
    abi_version = "local",  # TODO: gcc-X.Y
    compile_flags = [
        "-U_FORTIFY_SOURCE",  # TODO: remove (redundant)
        "-fstack-protector",
        "-Wall",  # TODO: move warning settings to cc_library wrapper macro, check if we need to enable treat_warnings_as_errors feature
        "-Wunused-but-set-parameter",
        "-Wno-free-nonheap-object",
        "-fno-omit-frame-pointer",
    ],
    compiler = "compiler",  # TODO: gcc-X.Y.Z
    coverage_compile_flags = ["--coverage"],
    coverage_link_flags = ["--coverage"],
    cpu = "k8",  # TODO: set "the target architecture string"
    cxx_builtin_include_directories = [
        "/usr/lib/gcc/x86_64-linux-gnu/9/include",
        "/usr/local/include",
        "/usr/include/x86_64-linux-gnu",
        "/usr/include",
        "/usr/include/c++/9",
        "/usr/include/x86_64-linux-gnu/c++/9",
        "/usr/include/c++/9/backward",
    ],
    cxx_flags = ["-std=c++17"],
    dbg_compile_flags = ["-g"],
    host_system_name = "local",
    link_flags = [
        "-fuse-ld=gold",  # TODO: remove for parity with aarch64 toolchain
        "-Wl,-no-as-needed",  # TODO: remove for parity with aarch64 toolchain
        "-Wl,-z,relro,-z,now",
        "-B/usr/bin",
        "-pass-exit-codes",
        "-lstdc++",
        "-lm",
        # TODO: add -lrt for parity with aarch64 toolchain
    ],
    link_libs = [],
    opt_compile_flags = [
        "-g0",
        "-O2",
        "-D_FORTIFY_SOURCE=1",
        "-DNDEBUG",
        "-ffunction-sections",
        "-fdata-sections",
    ],
    opt_link_flags = ["-Wl,--gc-sections"],
    supports_start_end_lib = True,
    target_libc = "local",  # TODO: glibc-2.31
    target_system_name = "local",
    tool_paths = {
        "ar": "/usr/bin/ar",
        "cpp": "/usr/bin/cpp",
        "dwp": "/usr/bin/dwp",
        "gcc": "/usr/bin/gcc",
        "gcov": "/usr/bin/gcov",
        "ld": "/usr/bin/ld",
        "llvm-cov": "/usr/bin/llvm-cov",  # added to support cc_toolchain_config from @bazel_tools
        "nm": "/usr/bin/nm",
        "objcopy": "/usr/bin/objcopy",
        "objdump": "/usr/bin/objdump",
        "strip": "/usr/bin/strip",
    },
    toolchain_identifier = "local",
    unfiltered_compile_flags = [
        "-fno-canonical-system-headers",
        "-Wno-builtin-macro-redefined",
        "-D__DATE__=\"redacted\"",
        "-D__TIMESTAMP__=\"redacted\"",
        "-D__TIME__=\"redacted\"",
    ],
)

toolchain(
    name = "cc_toolchain_k8",  # TODO: rename to x86_64 for clarity
    exec_compatible_with = [
        "@platforms//cpu:x86_64",
        "@platforms//os:linux",
    ],
    target_compatible_with = [
        "@platforms//cpu:x86_64",
        "@platforms//os:linux",
    ],
    toolchain = ":cc_compiler_k8",
    toolchain_type = "@rules_cc//cc:toolchain_type",
)
