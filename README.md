# Bazel cpp error repro

## to repro
set .bazelversion to 7.1.0

```bash
bazelisk test //rust:all


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

## Working on 6.3.2
Set .bazelversion to 6.3.2
```bash
bazelisk test //rust:all
```