cc_binary(
    name = "shell",
    srcs = ["shell.c"],
    # Disable Bazel's default behavior of linking to `libstdc++` / `libc++`.
    features = ["-default_link_libs"],
    deps = [":sqlite3"],
    visibility = ["//visibility:public"],
)

cc_library(
    name = "sqlite3",
    srcs = ["sqlite3.c"],
    hdrs = ["sqlite3.h"],
    deps = ["@//third_party:libdl", "@//third_party:libpthread"],
    includes = ["."],
    visibility = ["//visibility:public"],
)

cc_library(
    name = "sqlite3ext",
    hdrs = ["sqlite3ext.h"],
    visibility = ["//visibility:public"],
)
