# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils

DESCRIPTION="Viber is an instant messaging and Voice over IP"
HOMEPAGE="http://www.viber.com/"
SRC_URI="http://download.cdn.viber.com/desktop/Linux/${PN}.deb"

LICENSE=""
SLOT="live"
KEYWORDS="~amd64"

DEPEND="app-admin/chrpath"

RESTRICT="mirror bindist strip"

S="${WORKDIR}"

src_unpack() {
	default_src_unpack
	unpack ./data.tar.gz
}

src_prepare() {
	epatch "${FILESDIR}/${P}-desktop.patch"
}

src_install() {
	chrpath -d opt/${PN}/Viber || die

	doins -r opt usr
	fperms 755 /opt/${PN}/Viber

	into /opt
	dobin "${FILESDIR}/${PN}"
	fowners root:audio /opt/bin/${PN} /opt/${PN}/Viber
}
