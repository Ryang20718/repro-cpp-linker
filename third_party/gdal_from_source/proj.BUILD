# Copyright (c) 2023 Waabi Innovation. All rights reserved.
load("@rules_foreign_cc//foreign_cc:defs.bzl", "cmake")

filegroup(
    name = "all_srcs",
    srcs = glob(["**"]),
)

# MIT style License
# https://github.com/OSGeo/PROJ#License-1-ov-file
cmake(
    name = "proj",
    lib_source = ":all_srcs",
    cache_entries = {
        "BUILD_TESTING": "OFF",
        "BUILD_SHARED_LIBS": "ON",
        "CMAKE_BUILD_TYPE": "RELEASE",
        "TIFF_LIBRARY_RELEASE": "$EXT_BUILD_DEPS/libtiff/lib/libtiff.a",
        "TIFF_INCLUDE_DIR": "$EXT_BUILD_DEPS/libtiff/include",
        "BUILD_PROJSYNC": "off",
        "SQLITE3_LIBRARY": "$EXT_BUILD_DEPS/lib/libsqlite3.pic.a",
        "ENABLE_CURL": "off",
        "EXE_SQLITE3": "$SQLITE3_EXECUTEABLE",
    },
    env = {
        # `proj` requires the sqlite3 shell to build a database during compilation
        "SQLITE3_EXECUTEABLE": "$(execpath @sqlite3//:shell)",
    },
    out_include_dir = "include",
    out_shared_libs = [
        "libproj.so",
        "libproj.so.25",
    ],
    out_data_dirs = [
        # proj.db files
        "share",
    ],
    build_args = ["-j 8"],
    deps = [
        "@sqlite3",
        "@tiff",
    ],
    build_data = [
        "@sqlite3//:shell",
    ],
    visibility = ["//visibility:public"],
)

filegroup(
    name = "proj_dir",
    srcs = [":proj"],
    output_group = "gen_dir",
    data = [":proj"],
    visibility = ["@gdal_from_source//:__subpackages__"],
)
