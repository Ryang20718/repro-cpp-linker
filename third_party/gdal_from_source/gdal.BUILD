# Copyright (c) 2021 Waabi Innovation. All rights reserved.
load("@rules_foreign_cc//foreign_cc:defs.bzl", "configure_make")

filegroup(
    name = "all_srcs",
    srcs = glob(["**"]),
    visibility = ["//visibility:public"],
)

# MIT style license
# https://github.com/OSGeo/gdal#security-ov-file
configure_make(
    name = "gdal_from_source",
    lib_name = "libgdal",
    env = {
        "CXXFLAGS": "-fPIC ",
        "CFLAGS": "-fPIC ",
        "PROJ_LIB": "$$EXT_BUILD_DEPS/proj/proj/share/proj",
    },
    out_static_libs = [
        "libgdal.a",
    ],
    out_data_dirs=[
        # TODO: This isn't correct as the `$EXT_BUILD_DEPS` isn't being resolved
        "$$EXT_BUILD_DEPS/proj/proj/share/proj",
    ],
    lib_source = ":all_srcs",
    configure_in_place = True,
    configure_options = [
        "--enable-shared=no",
        "--enable-static=yes",
        "--disable-all-optional-drivers",
        "--with-python=no",
        "--with-sqlite3=no",
        "--with-xml2=no",
        "--with-exr=no",
        "--with-expat=no",
        '--with-curl="${EXT_BUILD_DEPS}/curl"',
        '--with-geotiff=internal',
        '--with-gif=internal', # TODO: Use https://github.com/bazelbuild/bazel-central-registry/tree/main/modules/giflib
        '--with-lerc=internal',
        '--with-jpeg="${EXT_BUILD_DEPS}/jpeg"',
        '--with-libtiff=internal', # TODO: Should use @tiff
        '--with-libz="${EXT_BUILD_DEPS}/lib"',
        '--with-png="internal"', # TODO: Use https://github.com/bazelbuild/bazel-central-registry/tree/main/modules/libpng
        '--with-proj="${EXT_BUILD_DEPS}/proj/"',
    ] + select({
        "@platforms//cpu:arm64": ["--host=aarch64"], # Cross compilation support
        "//conditions:default": [],
    }),
    deps = [
        "@zstd",
        "@proj",
        "@jpeg",
        "@zlib",
        "@curl",
    ],
    data = ["@proj//:proj_dir"],
    args = ["-j 8"],
    # If you need to depend on this target, use third_party:gdal_cc
    visibility = ["@//third_party:__subpackages__"],
    # This target only partially works for compilation on x86
    # Comment out this constraint if attempting to resolve remaining x86 issues
    target_compatible_with = [
        "@platforms//cpu:arm64",
    ],
)
