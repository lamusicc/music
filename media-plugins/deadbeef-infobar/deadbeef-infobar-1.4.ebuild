# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit eutils

DESCRIPTION="Infobar plugin for DeadBeeF audio player. Shows lyrics and artist's biography for the current track."
HOMEPAGE="https://bitbucket.org/dsimbiriatin/deadbeef-infobar/wiki/Home"
SRC_URI="https://bitbucket.org/dsimbiriatin/${PN}/downloads/${P}.tar.gz"

RESTRICT="mirror"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~*"
IUSE="+gtk2 gtk3"
REQUIRED_USE="|| ( gtk2 gtk3 )"

RDEPEND="dev-libs/libxml2
	x11-libs/gdk-pixbuf[jpeg]
	media-sound/deadbeef[curl]
	gtk2? ( media-sound/deadbeef[gtk2] )
	gtk3? ( media-sound/deadbeef[gtk3] )"

DEPEND="${RDEPEND}"

src_prepare() {
	epatch "${FILESDIR}/${PN}-cflags.diff"
	epatch "${FILESDIR}/${PN}-load-gtk2-and-gtk3-version-fix.diff"
	epatch "${FILESDIR}/${PN}-focus-fix.diff"
}

src_compile() {
	if use gtk2 ; then
		emake gtk2
	fi

	if use gtk3 ; then
		emake gtk3
	fi
}

src_install() {
	if use gtk2 ; then
		insinto "/usr/$(get_libdir)/deadbeef"
		doins gtk2/ddb_infobar_gtk2.so || die
	fi

	if use gtk3 ; then
		insinto "/usr/$(get_libdir)/deadbeef"
		doins gtk3/ddb_infobar_gtk3.so || die
	fi
}
