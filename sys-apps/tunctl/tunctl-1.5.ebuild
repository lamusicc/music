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
IUSE=""

DEPEND="app-text/docbook-sgml-utils"

RDEPEND="${DEPEND}"

#S="${WORKDIR}/tunctl"

src_unpack() {
	unpack "${A}"
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

