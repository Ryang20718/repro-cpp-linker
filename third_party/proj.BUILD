load("@bazel_skylib//rules:expand_template.bzl", "expand_template")
load("@//third_party:dir.bzl", "dir")

SUBSTITUTIONS = {
    "#cmakedefine HAVE_LIBDL 1": "#define HAVE_LIBDL 1",
    "#cmakedefine HAVE_LOCALECONV 1": "#define HAVE_LOCALECONV 1",
    "#cmakedefine HAVE_STRERROR 1": "#define HAVE_STRERROR 1",
    "#cmakedefine PACKAGE \"${PACKAGE}\"": "#define PACKAGE \"proj\"",
    "#cmakedefine PACKAGE_BUGREPORT \"${PACKAGE_BUGREPORT}\"": "#define PACKAGE_BUGREPORT \"https://github.com/OSGeo/PROJ/issues\"",
    "#cmakedefine PACKAGE_NAME \"${PACKAGE_NAME}\"": "#define PACKAGE_NAME \"PROJ\"",
    "#cmakedefine PACKAGE_STRING \"${PACKAGE_STRING}\"": "#define PACKAGE_STRING \"PROJ 9.1.0\"",
    "#cmakedefine PACKAGE_TARNAME \"${PACKAGE_TARNAME}\"": "#define PACKAGE_TARNAME \"proj\"",
    "#cmakedefine PACKAGE_VERSION \"${PACKAGE_VERSION}\"": "#define PACKAGE_VERSION \"9.1.0\"",
    "#cmakedefine VERSION \"${VERSION}\"": "/* #undef VERSION */",
}

expand_template(
    name = "expand_proj_config",
    out = "src/proj_config.h",
    substitutions = SUBSTITUTIONS,
    template = "cmake/proj_config.cmake.in",
)

CORE = [
    "src/4D_api.cpp",
    "src/aasincos.cpp",
    "src/adjlon.cpp",
    "src/auth.cpp",
    "src/ctx.cpp",
    "src/datum_set.cpp",
    "src/datums.cpp",
    "src/deriv.cpp",
    "src/dmstor.cpp",
    "src/ell_set.cpp",
    "src/ellps.cpp",
    "src/factors.cpp",
    "src/fwd.cpp",
    "src/gauss.cpp",
    "src/generic_inverse.cpp",
    "src/geodesic.c",
    "src/init.cpp",
    "src/initcache.cpp",
    "src/internal.cpp",
    "src/inv.cpp",
    "src/list.cpp",
    "src/log.cpp",
    "src/malloc.cpp",
    "src/mlfn.cpp",
    "src/msfn.cpp",
    "src/mutex.cpp",
    "src/param.cpp",
    "src/phi2.cpp",
    "src/pipeline.cpp",
    "src/pj_list.h",
    "src/pr_list.cpp",
    "src/proj_internal.h",
    "src/proj_mdist.cpp",
    "src/qsfn.cpp",
    "src/release.cpp",
    "src/rtodms.cpp",
    "src/strerrno.cpp",
    "src/strtod.cpp",
    "src/tsfn.cpp",
    "src/units.cpp",
    "src/wkt1_generated_parser.c",
    "src/wkt1_generated_parser.h",
    "src/wkt1_parser.cpp",
    "src/wkt1_parser.h",
    "src/wkt2_generated_parser.c",
    "src/wkt2_generated_parser.h",
    "src/wkt2_parser.cpp",
    "src/wkt2_parser.h",
    "src/wkt_parser.cpp",
    "src/wkt_parser.hpp",
    "src/zpoly1.cpp",
    "src/proj_json_streaming_writer.hpp",
    "src/proj_json_streaming_writer.cpp",
    "src/tracing.cpp",
    "src/grids.hpp",
    "src/grids.cpp",
    "src/filemanager.hpp",
    "src/filemanager.cpp",
    "src/networkfilemanager.cpp",
    "src/sqlite3_utils.hpp",
    "src/sqlite3_utils.cpp",
    "src/proj_config.h",
]

cc_library(
    name = "hdrs",
    hdrs = [
        "src/proj.h",
        "src/proj_experimental.h",
        "src/proj_constants.h",
        "src/proj_symbol_rename.h",
        "src/geodesic.h",
    ],
    includes = ["src"],
)

cc_library(
    name = "proj_lib",
    srcs = CORE + glob(["src/iso19111/**/*.cpp", "src/iso19111/**/*.hpp"]) + glob(["src/transformations/*.cpp", "src/transformations/*.hpp"]) + glob(["src/conversions/*.cpp"]) + glob(["src/projections/*.cpp"]) + [
        "include/proj/common.hpp",
        "include/proj/coordinateoperation.hpp",
        "include/proj/coordinatesystem.hpp",
        "include/proj/crs.hpp",
        "include/proj/datum.hpp",
        "include/proj/internal/coordinatesystem_internal.hpp",
        "include/proj/internal/crs_internal.hpp",
        "include/proj/internal/include_nlohmann_json.hpp",
        "include/proj/internal/internal.hpp",
        "include/proj/internal/io_internal.hpp",
        "include/proj/internal/lru_cache.hpp",
        "include/proj/internal/mutex.hpp",
        "include/proj/internal/tracing.hpp",
        "include/proj/internal/vendor/nlohmann/json.hpp",
        "include/proj/io.hpp",
        "include/proj/metadata.hpp",
        "include/proj/nn.hpp",
        "include/proj/util.hpp",
        "src/mlfn.hpp",
        "src/quadtree.hpp",
    ],
    copts = ["-DTIFF_ENABLED", "-DMUTEX_pthread", "-lpthread"],
    includes = ["include", "src"],
    deps = [
        "@sqlite3",
        "@tiff",
        ":hdrs",
    ],
    data = [
        ":proj_data",
    ],
    visibility = ["//visibility:public"],
)

TEST_ENV = {
    "PROJ_DEBUG": "3",
    "PROJ_DATA": "$(location :proj_data)",
    "PROJ_SKIP_READ_USER_WRITABLE_DIRECTORY": "YES",
}

[
    cc_test(
        name = src,
        srcs = [
            "test/unit/main.cpp",
            "test/unit/" + src + ".cpp",
            "test/unit/gtest_include.h",
        ],
        env = TEST_ENV,
        data = [
            ":proj_data",
        ],
        deps = [
            ":proj",
            "@gtest//:gtest_main",
        ],
    )
    for src in [
        "proj_angular_io_test",
        "proj_context_test",
        "pj_phi2_test",
        "test_defmodel",
        "test_tinshift",
        "test_misc",
    ]
]

cc_test(
    name = "test_fork",
    srcs = [
        "test/unit/test_fork.c",
        "test/unit/gtest_include.h",
    ],
    copts = ["-DMUTEX_pthread"],
    env = TEST_ENV,
    data = [
        ":proj_data",
    ],
    deps = [
        ":proj",
        "@gtest//:gtest_main",
    ],
)

expand_template(
    name = "substitute_metadata_sql",
    out = "data/sql/metadata.out.sql",
    substitutions = {
        "${PROJ_VERSION}": "9.1.0",
    },
    template = "data/sql/metadata.sql",
    visibility = ["//visibility:public"],
)

genrule(
    name = "concat_sql_files",
    srcs = [
        "data/sql/begin.sql",
        "data/sql/proj_db_table_defs.sql",
        "data/sql/conversion_triggers.sql",
        "data/sql/customizations_early.sql",
        "data/sql/metadata.out.sql",
        "data/sql/unit_of_measure.sql",
        "data/sql/extent.sql",
        "data/sql/scope.sql",
        "data/sql/coordinate_system.sql",
        "data/sql/axis.sql",
        "data/sql/ellipsoid.sql",
        "data/sql/prime_meridian.sql",
        "data/sql/geodetic_datum.sql",
        "data/sql/geodetic_datum_ensemble_member.sql",
        "data/sql/vertical_datum.sql",
        "data/sql/vertical_datum_ensemble_member.sql",
        "data/sql/conversion.sql",
        "data/sql/geodetic_crs.sql",
        "data/sql/projected_crs.sql",
        "data/sql/vertical_crs.sql",
        "data/sql/compound_crs.sql",
        "data/sql/helmert_transformation.sql",
        "data/sql/grid_transformation.sql",
        "data/sql/grid_transformation_custom.sql",
        "data/sql/other_transformation.sql",
        "data/sql/other_transformation_custom.sql",
        "data/sql/concatenated_operation.sql",
        "data/sql/concatenated_operation_step.sql",
        "data/sql/alias_name.sql",
        "data/sql/supersession.sql",
        "data/sql/deprecation.sql",
        "data/sql/esri.sql",
        "data/sql/ignf.sql",
        "data/sql/nkg.sql",
        "data/sql/iau.sql",
        "data/sql/grid_alternatives.sql",
        "data/sql/grid_alternatives_generated_noaa.sql",
        "data/sql/customizations.sql",
        "data/sql/nkg_post_customizations.sql",
        "data/sql/commit.sql",
    ],
    outs = ["concatenated.sql"],
    cmd = "cat $(SRCS) > $@",
)

genrule(
    name = "generate_proj_db",
    srcs = [":concat_sql_files"],
    tools = ["@sqlite3//:shell"],
    cmd = "$(execpath @sqlite3//:shell) $@ <$<",
    outs = ["proj.db"],
)

dir(
    name = "proj_data",
    srcs = [
        ":generate_proj_db",
        "data/proj.ini",
    ],
    visibility = ["//visibility:public"],
)

cc_shared_library(
    name = "proj_so",
    shared_lib_name = "libproj-8d95adc6.so.25.9.2.0",
    deps = [":proj_lib"],
    exports_filter = [
        "@tiff//:tiff",
        "@jpeg//:jpeg",
        "@jpeg//:jpeg12",
        "@jpeg//:jpeg16",
        "@lerc//:lerc",
        "@zstd//:zstd",
        "@zlib//:z",
    ],
    visibility = ["//visibility:public"],
)

cc_library(
    name = "proj",
    srcs = [
        ":proj_so",
    ],
    deps = [
        ":hdrs",
    ],
    data = [
        ":proj_data"
    ],
    visibility = ["//visibility:public"],
)
