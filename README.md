# Bazel CC Shared Library error repro

## Bazel CC Shared Library Working on 7.3.2
This is a dummy toy repo to repro some issues when transitioning to bazel version 7.4.0
```bash
bazelisk test //rust:all
```

## Error on bazel 7.3.2
set .bazelversion to 7.3.2

```bash
bazelisk build @gdal//:gdal


Traceback (most recent call last):
        File "/virtual_builtins_bzl/common/cc/cc_shared_library.bzl", line 670, column 114, in _cc_shared_library_impl
        File "/virtual_builtins_bzl/common/cc/cc_shared_library.bzl", line 530, column 44, in _filter_inputs
        File "/virtual_builtins_bzl/common/cc/cc_shared_library.bzl", line 79, column 28, in _sort_linker_inputs
        File "/virtual_builtins_bzl/common/cc/cc_shared_library.bzl", line 55, column 9, in _programmatic_error
Error in fail: Your build has triggered a programmatic error in the cc_shared_library rule. Please file an issue in https://github.com/bazelbuild/bazel : @gdal//:gcore,@gdal//:gcore_mdreader,@gdal//:geotiff,@proj//:proj_so_deps,@gdal//:ogr,@gdal//:apps,@gdal//:alg,@gdal//:gdal_standard_includes,@gdal//:cpl,@gdal//:json,@proj//:proj_so_deps,@lz4//:lz4,@curl//:curl,@proj//:proj_so_deps,@crate_index__rustls-ffi-0.12.0//:hdr,@gdal//:cpl_config,@proj//:proj,@proj//:proj,@proj//:hdrs,@gdal//:ogr_headers,@gdal//:gdal_version,@proj//:proj_so vs 23
```
