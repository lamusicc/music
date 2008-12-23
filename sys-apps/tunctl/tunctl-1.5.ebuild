# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

RESTRICT="mirror"

DESCRIPTION="tunctl is a small tool for controlling Linux TUN/TAP devices."
HOMEPAGE="http://tunctl.sourceforge.net/"
SRC_URI="http://downloads.sourceforge.net/tunctl/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~ppc ~x86-fbsd"
IUSE="with_man"

DEPEND="with_man? ( app-text/docbook-sgml-utils )"

RDEPEND="${DEPEND}"

src_unpack() {
	if use with_man; then
	unpack "${A}"
else
	unpack "${A}"
	cd "${S}"
	epatch "${FILESDIR}"/Makefile.patch
fi
}

src_compile() {
	cd "${S}"
	emake || die
}

src_install() {
	cd "${S}"
	dodir /usr/sbin
	dosbin tunctl
	dodir /usr/share/tunctl
	dodir /usr/share/man/man1
	emake install DESTDIR="${D}" || die
}

