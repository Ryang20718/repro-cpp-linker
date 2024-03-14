
load("@rules_foreign_cc//foreign_cc:defs.bzl", "configure_make")

filegroup(
    name = "all_srcs",
    srcs = glob(["**"]),
    visibility = ["//visibility:public"],
)

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
        '--with-gif=internal',
        '--with-lerc=internal',
        '--with-jpeg="${EXT_BUILD_DEPS}/jpeg"',
        '--with-libtiff=internal',
        '--with-libz="${EXT_BUILD_DEPS}/lib"',
        '--with-png="internal"',
        '--with-proj="${EXT_BUILD_DEPS}/proj/"',
    ] + select({
        "@platforms//cpu:arm64": ["--host=aarch64"],
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
    visibility = ["@//third_party:__subpackages__"],
    target_compatible_with = [
        "@platforms//cpu:arm64",
    ],
)
