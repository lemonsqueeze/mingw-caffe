
[ nohdf5 branch ] caffe without hdf5 dependency / support.

-------------------------------------------------------------------------------------------

[![Build status](https://ci.appveyor.com/api/projects/status/uj5aafc9cmrt9dh2?svg=true)](https://ci.appveyor.com/project/lemonsqueeze/mingw-caffe)

Binary packages: [Releases](https://github.com/lemonsqueeze/mingw-caffe/releases)

These files can be used to build a minimal cpu-only [caffe](https://github.com/BVLC/caffe) package for msys2 / mingw-w64.  
Build pulls nohdf5 branch from [lemonsqueeze/caffe](https://github.com/lemonsqueeze/caffe/tree/nohdf5).

To build, run an MSYS2 shell, install dependencies:

    pacman -S git make patch diffutils
    
    # 32-bit build:
    pacman -S mingw32/mingw-w64-i686-tools-git          # gendef, dlltool
    pacman -S mingw32/mingw-w64-i686-gcc
    pacman -S mingw32/mingw-w64-i686-boost
    pacman -S mingw32/mingw-w64-i686-protobuf-c
    pacman -S mingw32/mingw-w64-i686-gflags
    pacman -S mingw32/mingw-w64-i686-glog
    pacman -S mingw32/mingw-w64-i686-openblas
    
    # 64-bit build:
    pacman -S mingw64/mingw-w64-x86_64-tools-git        # gendef, dlltool
    pacman -S mingw64/mingw-w64-x86_64-gcc
    pacman -S mingw64/mingw-w64-x86_64-boost
    pacman -S mingw64/mingw-w64-x86_64-protobuf-c
    pacman -S mingw64/mingw-w64-x86_64-gflags
    pacman -S mingw64/mingw-w64-x86_64-glog
    pacman -S mingw64/mingw-w64-x86_64-openblas


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
