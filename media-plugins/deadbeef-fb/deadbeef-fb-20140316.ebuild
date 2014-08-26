# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

DEADBEEF_GUI="yes"

inherit autotools deadbeef-plugins

DESCRIPTION="DeaDBeeF filebrowser plugin"
HOMEPAGE="http://sourceforge.net/projects/deadbeef-fb/"
SRC_URI="mirror://sourceforge/${PN}/${PN}_${PV}_src.tar.gz"

RESTRICT="mirror"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~*"

S="${WORKDIR}/deadbeef-devel"

src_prepare() {
	epatch "${FILESDIR}/${PN}-avoid-version.patch"

	if use gtk3 ; then
		epatch "${FILESDIR}/${PN}-stop-treating-warnings-as-errors.patch"
	fi

	eautoreconf
}

src_configure() {
	econf --disable-static \
		$(use_enable gtk2) \
		$(use_enable gtk3)
}

