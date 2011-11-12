# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

RESTRICT="mirror"


DESCRIPTION="A tiny scanner for tcp socket 1995"
HOMEPAGE="http://lamusic.dyndns.info/"
SRC_URI="https://raw.github.com/lamusicc/archives/master/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~ppc ~x86-fbsd"
IUSE=""

DEPEND=""

RDEPEND="${DEPEND}"

S="${WORKDIR}/strobe"

src_unpack() {
	unpack "${A}"
	cd "${S}"
	sed -i Makefile \
	-e "s:^INSTALLDIR.*:INSTALLDIR=${D}/usr/bin:" \
	-e "s:^LIBDIR.*:LIBDIR=${D}/usr/share/strobe:" \
	-e "s:^MANDIR.*:MANDIR=${D}/usr/share/man/man1:"
}

src_compile() {
	cd "${S}"
	emake || die
}

src_install() {
	cd "${S}"
	dodir /usr/bin
	dodir /usr/share/strobe
	dodir /usr/share/man/man1
	emake install || die
}

