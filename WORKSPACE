load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")


http_archive(
    name = "bazel_skylib",
    sha256 = "74d544d96f4a5bb630d465ca8bbcfe231e3594e5aae57e1edbf17a6eb3ca2506",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.3.0/bazel-skylib-1.3.0.tar.gz",
        "https://github.com/bazelbuild/bazel-skylib/releases/download/1.3.0/bazel-skylib-1.3.0.tar.gz",
    ],
)

load("@bazel_skylib//:workspace.bzl", "bazel_skylib_workspace")

bazel_skylib_workspace()

http_archive(
    name = "lz4",
    build_file = "@//third_party:lz4.BUILD",
    sha256 = "0b0e3aa07c8c063ddf40b082bdf7e37a1562bda40a0ff5272957f3e987e0e54b",
    strip_prefix = "lz4-1.9.4",
    urls = ["https://github.com/lz4/lz4/releases/download/v1.9.4/lz4-1.9.4.tar.gz"],
)

http_archive(
    name = "lerc",
    build_file = "@//third_party:lerc.BUILD",
    sha256 = "c2c55573f52be758551175cdb7869b16101ab2e07449f908e69a33ac61169a6e",
    strip_prefix = "lerc-4.0.0",
    urls = ["https://github.com/Esri/lerc/archive/refs/tags/v4.0.0.zip"],
)


http_archive(
    name = "jpeg",
    build_file = "@//third_party:jpeg.BUILD",
    sha256 = "28971baf7f8a2b7d425093e1cdf53a80ebc4d709374108d1797d292b93ed3ab4",
    strip_prefix = "libjpeg-turbo-2.1.91",
    urls = ["https://github.com/libjpeg-turbo/libjpeg-turbo/releases/download/2.1.91/libjpeg-turbo-2.1.91.tar.gz"],
)

http_archive(
    name = "zstd",
    build_file = "@//third_party:zstd.BUILD",
    sha256 = "9c4396cc829cfae319a6e2615202e82aad41372073482fce286fac78646d3ee4",
    strip_prefix = "zstd-1.5.5",
    urls = ["https://github.com/facebook/zstd/releases/download/v1.5.5/zstd-1.5.5.tar.gz"],
)


http_archive(
    name = "zlib",
    build_file = "@//third_party:zlib.BUILD",
    sha256 = "ff0ba4c292013dbc27530b3a81e1f9a813cd39de01ca5e0f8bf355702efa593e",
    strip_prefix = "zlib-1.3",
    urls = ["https://github.com/madler/zlib/releases/download/v1.3/zlib-1.3.tar.gz"],
)

http_archive(
    name = "curl",
    build_file = "//third_party:curl.BUILD",
    sha256 = "b136cdcda94147e43a610f0d9a2a37a892fa5c88f00a1fa719f70bdc009e6739",
    strip_prefix = "curl-17d302e56221f5040092db77d4f85086e8a20e0e",
    urls = ["https://github.com/curl/curl/archive/17d302e56221f5040092db77d4f85086e8a20e0e.zip"],
)

http_archive(
    name = "proj",
    build_file = "@//third_party/gdal_from_source:proj.BUILD",
    sha256 = "81b2239b94cad0886222cde4f53cb49d34905aad2a1317244a0c30a553db2315",
    strip_prefix = "proj-9.1.0",
    urls = ["https://github.com/OSGeo/PROJ/releases/download/9.1.0/proj-9.1.0.tar.gz"],
)

http_archive(
    name = "tiff",
    build_file = "@//third_party:tiff.BUILD",
    sha256 = "d7f38b6788e4a8f5da7940c5ac9424f494d8a79eba53d555f4a507167dca5e2b",
    strip_prefix = "tiff-4.5.1",
    urls = ["https://download.osgeo.org/libtiff/tiff-4.5.1.tar.gz"],
)

http_archive(
    name = "gdal",
    build_file = "@//third_party:gdal.BUILD",
    patch_args = ["-p1"],
    patches = ["//third_party:gdal.patch"],
    sha256 = "7c4406ca010dc8632703a0a326f39e9db25d9f1f6ebaaeca64a963e3fac123d1",
    strip_prefix = "gdal-3.5.1",
    urls = ["https://github.com/OSGeo/gdal/releases/download/v3.5.1/gdal-3.5.1.tar.gz"],
)

http_archive(
    name = "gdal_from_source",
    build_file = "@//third_party/gdal_from_source:gdal.BUILD",
    sha256 = "7c4406ca010dc8632703a0a326f39e9db25d9f1f6ebaaeca64a963e3fac123d1",
    strip_prefix = "gdal-3.5.1",
    urls = ["https://github.com/OSGeo/gdal/releases/download/v3.5.1/gdal-3.5.1.tar.gz"],
)

http_archive(
    name = "sqlite3",
    build_file = "@//third_party:sqlite3.BUILD",
    sha256 = "1cc824d0f5e675829fa37018318fda833ea56f7e9de2b41eddd9f7643b5ec29e",
    strip_prefix = "sqlite-amalgamation-3420000",
    urls = ["https://sqlite.org/2023/sqlite-amalgamation-3420000.zip"],
)

http_archive(
    name = "rules_foreign_cc",
    sha256 = "9561b3994232ccb033278ade83c2ce48e763e9cae63452cd8fea457bedd87d05",
    strip_prefix = "rules_foreign_cc-816905a078773405803e86635def78b61d2f782d",
    url = "https://github.com/bazelbuild/rules_foreign_cc/archive/816905a078773405803e86635def78b61d2f782d.tar.gz",
)

load("@rules_foreign_cc//foreign_cc:repositories.bzl", "rules_foreign_cc_dependencies")

rules_foreign_cc_dependencies(
    native_tools_toolchains = [
        "@rules_foreign_cc//toolchains:built_meson_toolchain",
    ],
    register_built_tools = False,
    register_preinstalled_tools = True,
)

http_archive(
    name = "rules_cc",
    sha256 = "2037875b9a4456dce4a79d112a8ae885bbc4aad968e6587dca6e64f3a0900cdf",
    strip_prefix = "rules_cc-0.0.9",
    urls = ["https://github.com/bazelbuild/rules_cc/releases/download/0.0.9/rules_cc-0.0.9.tar.gz"],
)

load("@rules_cc//cc:repositories.bzl", "rules_cc_dependencies")

rules_cc_dependencies()

register_toolchains("//:cc_toolchain_k8")


http_archive(
    name = "rules_rust",
    urls = ["https://github.com/bazelbuild/rules_rust/releases/download/0.39.0/rules_rust-v0.39.0.tar.gz"],
)

load("@rules_rust//rust:repositories.bzl", "rules_rust_dependencies")

rules_rust_dependencies()

load("//:setup.bzl", "configure_rust_toolchain")

configure_rust_toolchain()

load("@crate_index//:defs.bzl", "crate_repositories")


http_archive(
    name = "rules_python",
    sha256 = "c68bdc4fbec25de5b5493b8819cfc877c4ea299c0dcb15c244c5a00208cde311",
    strip_prefix = "rules_python-0.31.0",
    url = "https://github.com/bazelbuild/rules_python/releases/download/0.31.0/rules_python-0.31.0.tar.gz",
)

load("@rules_python//python:repositories.bzl", "py_repositories", "python_register_toolchains")

py_repositories()

python_register_toolchains(
    name = "python310",
    python_version = "3.10",
)

load("@python310//:defs.bzl", "interpreter")

load("@rules_python//python:pip.bzl", "pip_parse")

pip_parse(
    name = "pip",
    python_interpreter_target = interpreter,
    requirements_lock = "//:requirements.txt",
)
