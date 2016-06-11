# Maintainer: David Grayson <davidegrayson@gmail.com>

_realname=caffe
pkgbase=mingw-w64-${_realname}
pkgname="${MINGW_PACKAGE_PREFIX}-${_realname}-git"
provides=("${MINGW_PACKAGE_PREFIX}-${_realname}")
conflicts=("${MINGW_PACKAGE_PREFIX}-${_realname}")
replaces=("${MINGW_PACKAGE_PREFIX}-${_realname}")
pkgver=3688.d0bd302
pkgrel=1
pkgdesc='Deep learning framework (mingw-w64)'
arch=('any')
url=''
license=('custom')
makedepends=(
  "${MINGW_PACKAGE_PREFIX}-gcc"
)
depends=(
  "${MINGW_PACKAGE_PREFIX}-boost"
  "${MINGW_PACKAGE_PREFIX}-gflags"
  "${MINGW_PACKAGE_PREFIX}-glog"
  "${MINGW_PACKAGE_PREFIX}-hdf5"
  "${MINGW_PACKAGE_PREFIX}-openblas"
  "${MINGW_PACKAGE_PREFIX}-opencv"
  "${MINGW_PACKAGE_PREFIX}-python2"
  "${MINGW_PACKAGE_PREFIX}-python2-numpy")
source=("git+https://github.com/BVLC/caffe"
        "Makefile.config"
        "general.patch")
sha256sums=('SKIP'
            'aaed466d5081d45b65325a98640fc41f99f158ce58c554cd379f803a09214fcb'
            '1ba19311806f6a460e36ac35301dc9cd1625cacada665b50bccb5f0e0ed2ff73')

pkgver() {
  cd "${srcdir}/caffe"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/caffe"
  git checkout windows
  cp "../Makefile.config" .
  patch -p1 -i ../general.patch
}

build() {
  cd "${srcdir}/caffe"
  make
}

package() {
  cd "${srcdir}/caffe"
  install -Dm644 LICENSE "${pkgdir}${MINGW_PREFIX}/share/licenses/${_realname}/LICENSE"
}
