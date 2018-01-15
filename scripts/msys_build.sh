#!/bin/sh
# msys build script for appveyor

die() { echo "$@"; exit 1; }

# Run in top-level directory
cd `dirname "$0"`/..

# Update pacman db and packages
pacman --noconfirm -Syu
pacman --noconfirm -Su
echo ""

# Install dependencies
if [ "$MINGW_INSTALLS" = "mingw32" ]; then
    pacman -S --noconfirm \
	mingw32/mingw-w64-i686-boost \
	mingw32/mingw-w64-i686-protobuf-c \
	mingw32/mingw-w64-i686-gflags \
	mingw32/mingw-w64-i686-glog \
	mingw32/mingw-w64-i686-hdf5 \
	mingw32/mingw-w64-i686-openblas \
	git make patch diffutils
else
    die "fixme"
fi
echo ""

echo "Using packages:"
pacman -Q | grep 'boost\|protobuf\|gflags\|glog\|hdf5\|openblas\|-gcc '
echo ""

# Fix bad header in mingw-w64-i686-boost-1.66.0-1
if [ -f /mingw32/include/boost/winapi/basic_types.hpp ]; then
    echo "Patching boost headers..."
    patch -d/ -p0 < boost_header_fix_mingw32.patch
    echo ""
fi


# Build
cd mingw-w64-caffe
makepkg-mingw

# Copy built package
mkdir ../build
cp *.pkg.tar.xz ../build/
