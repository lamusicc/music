# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="ddns is a small ddns client with multiple ddns server supports and a high flexibility."
HOMEPAGE="http://yaddns.github.com/"
SRC_URI="http://download.gna.org/${PN}/${PN}-1.1-rc4.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug"

DEPEND=""
RDEPEND="${DEPEND}"

S="${PN}-1.1-rc4"

src_configure() {
	cd "${S}"
	my_config="
	--disable-dependency-tracking
	$(use_enable debug)"
	econf ${my_config} || die
}

src_install() {
	cd "${S}"
	einstall
	insinto /etc
	newins etc/yaddns.conf yaddns.conf
}
