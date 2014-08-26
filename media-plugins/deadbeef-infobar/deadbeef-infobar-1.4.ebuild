# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

DEADBEEF_GUI="yes"

inherit deadbeef-plugins

DESCRIPTION="Infobar plugin for DeadBeeF audio player. Shows lyrics and artist's biography for the current track."
HOMEPAGE="https://bitbucket.org/dsimbiriatin/${PN}/wiki/Home"
SRC_URI="https://bitbucket.org/dsimbiriatin/${PN}/downloads/${P}.tar.gz"

RESTRICT="mirror"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~*"

RDEPEND="dev-libs/libxml2
	x11-libs/gdk-pixbuf[jpeg]
	media-sound/deadbeef[curl]"

DEPEND="${RDEPEND}"

src_prepare() {
	epatch "${FILESDIR}/${PN}-cflags.diff"
	epatch "${FILESDIR}/${PN}-load-gtk2-and-gtk3-version-fix.diff"
	epatch "${FILESDIR}/${PN}-focus-fix.diff"
}

