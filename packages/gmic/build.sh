TERMUX_PKG_HOMEPAGE=https://gmic.eu
TERMUX_PKG_DESCRIPTION="Full-featured framework for image processing"
TERMUX_PKG_LICENSE="CeCILL-2.1"
TERMUX_PKG_VERSION=2.6.6
TERMUX_PKG_SHA256=86c14da90daa0b3c09265b7b07976bf3f3a76f5b0786fecfd9fc3d9332ce0da0
TERMUX_PKG_SRCURL=https://gmic.eu/files/source/gmic_$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_DEPENDS="libc++, libcurl, fftw, libpng, libjpeg-turbo, libtiff, zlib"
TERMUX_PKG_BUILD_DEPENDS="graphicsmagick"
TERMUX_PKG_NO_DEVELSPLIT=yes
TERMUX_PKG_BUILD_IN_SRC=yes

termux_step_configure() {
	return 0;
}

termux_step_make() {
	cd src/
	make USR="$TERMUX_PREFIX" STRIP="$STRIP" \
	     CFLAGS="$CXXFLAGS" LIBS="$LDFLAGS" cli
}

termux_step_make_install() {
	cp src/gmic $TERMUX_PREFIX/bin/
	cp src/gmic-gm $TERMUX_PREFIX/bin/
	cp man/gmic.1.gz $TERMUX_PREFIX/share/man/man1/
	cp man/gmic.1.gz $TERMUX_PREFIX/share/man/man1/gmic-gm.1.gz
}

