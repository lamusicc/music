# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="The tunctl tool for controlling the TUN/TAP driver in Linux."
HOMEPAGE="http://tunctl.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="doc"

DEPEND="doc? ( app-text/docbook-sgml-utils )"
RDEPEND=""

src_unpack() {
	unpack "${A}"
	cd "${S}" && epatch "${FILESDIR}/${PN}-Makefile.patch"
}

src_compile() {
	emake
	use doc && emake man
}

src_install() {
	emake install DESTDIR="${D}"
	use doc && doman ${PN}.8
}
