# Bazel CC Shared Library error repro

## Bazel CC Shared Library Working on 6.3.2
This is a dummy toy repo to repro some issues when transitioning to bazel version 7
```bash
bazelisk test //rust:all
```

## Error on bazel 7.1.0
set .bazelversion to 7.1.0

```bash
bazelisk test //rust:all


Error in fail: The following libraries were linked statically by different cc_shared_libraries but not exported:
cc_shared_library @proj//:proj_so:
  "@tiff//:tiff",
  "@jpeg//:jpeg",
  "@jpeg//:jpeg12",
  "@jpeg//:jpeg16",
  "@lerc//:lerc",
  "@zstd//:zstd",
  "@zlib//:z",
If you are sure that the previous libraries are exported by the cc_shared_libraries because:
  1. You have visibility declarations in the source code
  2. Or you are passing a visibility script to the linker to export symbols from them
then add those libraries to roots or exports_filter for each cc_shared_library.
```

Should we try to export these targets as exports_filter, we see issues with the linker
```bash
...
Use --sandbox_debug to see verbose messages from the sandbox and retain the sandbox build root for debugging
bazel-out/k8-fastbuild/bin/_solib_k8/_U@@gdal_S_S_Cgdal___Uexternal_Sgdal/libgdal.so.31: error: undefined reference to 'TIFFReadRGBATileExt'
bazel-out/k8-fastbuild/bin/_solib_k8/_U@@gdal_S_S_Cgdal___Uexternal_Sgdal/libgdal.so.31: error: undefined reference to 'TIFFReadRGBAStripExt'
bazel-out/k8-fastbuild/bin/_solib_k8/_U@@gdal_S_S_Cgdal___Uexternal_Sgdal/libgdal.so.31: error: undefined reference to 'TIFFRGBAImageOK'
collect2: error: ld returned 1 exit status
Use --verbose_failures to see the command lines of failed build steps.
INFO: Elapsed time: 4.728s, Critical Path: 0.42s
INFO: 3 processes: 3 internal.
ERROR: Build did NOT complete successfully
//rust:rust_example_test                                        FAILED TO BUILD
```
