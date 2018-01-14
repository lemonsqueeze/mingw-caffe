
These files can be used to build a minimal cpu-only [caffe](https://github.com/BVLC/caffe) package for msys2 / mingw-w64.  
Build pulls latest caffe sources from git (windows branch).

To build, run an MSYS2 shell and install dependencies: (replace `mingw32` with `mingw64` for 64-bit build)

    pacman -S mingw32/mingw-w64-i686-gcc
    pacman -S mingw32/mingw-w64-i686-boost
    pacman -S mingw32/mingw-w64-i686-glog
    pacman -S mingw32/mingw-w64-i686-gflags
    pacman -S mingw32/mingw-w64-i686-protobuf
    pacman -S msys/git  msys/make  msys/diffutils

Navigate to mingw-w64-caffe directory and run `makepkg-mingw`.

The `MINGW_INSTALLS` variable can be set to `mingw64` if you only want to build the win64 version,
or `mingw32` if you only want to build the win32 version.

To install the built package on your system:

    pacman -U *.pkg.tar.xz


------------------------------------------------------------------------------------------------

Based on DavidEGrayson's [mingw-packages-deg](https://github.com/DavidEGrayson/mingw-packages-deg)

Fixed dll and 'Failed to parse NetParameter file' issues.

No extensive testing, but loading and forwarding trained networks works.
