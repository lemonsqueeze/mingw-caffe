[![Build status](https://ci.appveyor.com/api/projects/status/uj5aafc9cmrt9dh2?svg=true)](https://ci.appveyor.com/project/lemonsqueeze/mingw-caffe)

Binary packages: [Releases](https://github.com/lemonsqueeze/mingw-caffe/releases)

These files can be used to build a minimal cpu-only [caffe](https://github.com/BVLC/caffe) package for msys2 / mingw-w64.  
Build pulls latest caffe sources from git (master branch).

To build, run an MSYS2 shell, install dependencies: (replace `mingw32` with `mingw64` for 64-bit build)

    pacman -S mingw32/mingw-w64-i686-gcc
    pacman -S mingw32/mingw-w64-i686-boost
    pacman -S mingw32/mingw-w64-i686-protobuf-c
    pacman -S mingw32/mingw-w64-i686-gflags
    pacman -S mingw32/mingw-w64-i686-glog
    pacman -S mingw32/mingw-w64-i686-hdf5
    pacman -S mingw32/mingw-w64-i686-openblas
    pacman -S git make patch diffutils

Navigate to mingw-w64-caffe directory and run `makepkg-mingw`.

The `MINGW_INSTALLS` variable can be set to `mingw64` if you only want to build the win64 version,  
or `mingw32` if you only want to build the win32 version.

To install the built package on your system:

    pacman -U *.pkg.tar.xz


#### Issues

- Caffe fails to compile: error near STRICT in src/caffe/proto/caffe.pb.h  
  A header in current boost package is messed up, #defines STRICT when it really shouldn't.
  Try this:

      patch -d/ -p0 < boost_header_fix_mingw32.patch
      patch -d/ -p0 < boost_header_fix_mingw64.patch

- When linking statically, caffe fails with 'Unknown layer type: Input'  
  Currently you need to use something like this for static link to work:

      -Wl,--whole-archive -l:libcaffe.a -Wl,--no-whole-archive


------------------------------------------------------------------------------------------------

Based on DavidEGrayson's [mingw-packages-deg](https://github.com/DavidEGrayson/mingw-packages-deg)

Fixed dll and 'Failed to parse NetParameter file' issues.

No extensive testing, loading and forwarding trained networks works though.

TODO: build python layer
