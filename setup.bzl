load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@rules_rust//crate_universe:defs.bzl", "crate", "crates_repository", "splicing_config")
load("@rules_rust//rust:repositories.bzl", "rust_analyzer_toolchain_repository", "rust_register_toolchains")
load("@rules_rust//tools/rust_analyzer:deps.bzl", "rust_analyzer_deps")

def configure_rust_toolchain():
    rust_version = "1.76.0"
    nightly_version = "nightly/2024-02-22"

    rust_register_toolchains(
        edition = "2021",
        versions = [rust_version, nightly_version],
    )

    rust_analyzer_toolchain_repository(
        name = "rust_analyzer_toolchain",
        version = rust_version,
    )

    rust_analyzer_deps()

    crates_repository(
        name = "crate_index",
        lockfile = "//:cargo-bazel-lock.json",
        cargo_lockfile = "//:Cargo.lock",
        manifests = ["//:Cargo.toml"],
        isolated = True,
        annotations = {
            "gdal": [crate.annotation(
                build_script_env = {"DEP_GDAL_VERSION_NUMBER": "3050100"},
            )],
            "gdal-sys": [crate.annotation(
                build_script_env = {"GDAL_VERSION": "3.5.1"},
                deps = ["@gdal"],
            )],
            "rustls-ffi": [
                crate.annotation(
                    extra_aliased_targets = {"rustls-ffi_cc": "hdr"},
                    additive_build_file = "@//third_party:rustls-ffi.BUILD",
                ),
            ],
        },
        splicing_config = splicing_config(
            resolver_version = "2",
        ),
        rust_version = rust_version,
    )

