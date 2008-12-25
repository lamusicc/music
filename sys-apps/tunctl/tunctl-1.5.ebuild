# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $


RESTRICT="mirror"

DESCRIPTION="tunctl is a small tool for controlling Linux TUN/TAP devices."
HOMEPAGE="http://tunctl.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~ppc ~x86-fbsd"
IUSE="doc"

DEPEND="doc? ( app-text/docbook-sgml-utils )"

RDEPEND="${DEPEND}"

src_unpack() {
	unpack "${A}"
	if ! use doc; then
		cd "${S}"
		epatch "${FILESDIR}"/Makefile.patch
	fi
}

src_install() {
	emake install DESTDIR="${D}" || die
}

