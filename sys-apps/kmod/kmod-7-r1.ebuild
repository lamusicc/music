# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-apps/kmod/kmod-7.ebuild,v 1.9 2012/04/06 21:04:02 ssuominen Exp $

EAPI=4

EGIT_REPO_URI="git://git.kernel.org/pub/scm/utils/kernel/${PN}/${PN}.git"

[[ ${PV} == 9999 ]] && vcs=git-2
inherit ${vcs} autotools eutils toolchain-funcs
unset vcs

if [[ ${PV} != 9999 ]] ; then
	SRC_URI="mirror://kernel/linux/utils/kernel/kmod/${P}.tar.xz"
	KEYWORDS="~amd64 ~arm ~hppa ~mips ~ppc ~ppc64 ~x86"
fi

DESCRIPTION="library and tools for managing linux kernel modules"
HOMEPAGE="http://git.kernel.org/?p=utils/kernel/kmod/kmod.git"

LICENSE="LGPL-2"
SLOT="0"
IUSE="debug doc lzma static-libs +tools zlib"

RDEPEND="!sys-apps/module-init-tools
	!sys-apps/modutils
	lzma? ( app-arch/xz-utils )
	zlib? ( sys-libs/zlib )"
DEPEND="${RDEPEND}
	doc? ( dev-util/gtk-doc )
	lzma? ( dev-util/pkgconfig )
	zlib? ( dev-util/pkgconfig )"

# Upstream does not support running the test suite with custom configure flags.
# I was also told that the test suite is intended for kmod developers.
# So we have to restrict it.
# See bug #408915.
RESTRICT="test"

src_prepare()
{
	if [ ! -e configure ]; then
		if use doc; then
			gtkdocize --copy --docdir libkmod/docs || die
		else
			touch libkmod/docs/gtk-doc.make
		fi
		eautoreconf
	else
		elibtoolize
	fi
}

src_configure()
{
	# http://bugs.gentoo.org/410865
	if has_version '<sys-libs/zlib-1.2.6'; then
		export zlib_CFLAGS="-I/usr/include"
		export zlib_LIBS="-lz"
	fi

	local myconf
	[[ ${PV} == 9999 ]] && myconf="$(use_enable doc gtk-doc)"

	econf --prefix=/ --libdir=/lib64 \
		$(use_enable static-libs static) \
		$(use_enable tools) \
		$(use_enable debug) \
		$(use_with lzma xz) \
		$(use_with zlib) \
		${myconf}
}

src_install()
{
	default

	find "${D}" -name libkmod.la -exec rm -f {} +

	if use tools; then
		dodir /bin
		dosym /bin/kmod /bin/lsmod
		dosym /bin/kmod /usr/bin/kmod
		dosym /lib64/pkgconfig/libkmod.pc /usr/lib/pkgconfig/libkmod.pc
		dosym /include/libkmod.h /usr/include/libkmod.h
		dosym /lib/libkmod.so.2.1.1 /usr/lib/libkmod.so.2.1.1
		dosym /usr/lib/libkmod.so.2.1.1 /usr/lib/libkmod.so
		dosym /usr/lib/libkmod.so.2.1.1 /usr/lib/libkmod.so.2
		dodir /sbin
		local cmd
		for cmd in depmod insmod modinfo modprobe rmmod; do
			dosym /bin/kmod /sbin/${cmd}
		done
	fi
}