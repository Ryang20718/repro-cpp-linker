load("@bazel_skylib//rules:copy_file.bzl", "copy_file")

copy_file(
    name = "config_h",
    src = "@//third_party:expat_config.h",
    out = "include/expat_config.h",
)

EXPAT_HDRS = [
    "expat/lib/expat.h",
]

EXPAT_SRCS = [
    "expat/lib/ascii.h",
    "expat/lib/asciitab.h",
    "expat/lib/expat.h",
    "expat/lib/expat_external.h",
    "expat/lib/iasciitab.h",
    "expat/lib/internal.h",
    "expat/lib/latin1tab.h",
    "expat/lib/nametab.h",
    "expat/lib/siphash.h",
    "expat/lib/utf8tab.h",
    "expat/lib/winconfig.h",
    "expat/lib/xmlparse.c",
    "expat/lib/xmlrole.c",
    "expat/lib/xmlrole.h",
    "expat/lib/xmltok.c",
    "expat/lib/xmltok.h",
    "expat/lib/xmltok_impl.h",
    # Generated configuration file
    "include/expat_config.h",
]

TEXTUAL_HDRS = [
    "expat/lib/xmltok_impl.c",
    "expat/lib/xmltok_ns.c",
]

cc_library(
    name = "expat",
    srcs = EXPAT_SRCS,
    hdrs = EXPAT_HDRS,
    # EXPAT_FMT_PTRDIFF_T uses outdated format specifiers
    copts = ["-Wno-format"],
    defines = [
        "XML_STATIC",
    ],
    includes = [
        "expat/lib",
        "include",
    ],
    textual_hdrs = TEXTUAL_HDRS,
    visibility = ["//visibility:public"],
)
