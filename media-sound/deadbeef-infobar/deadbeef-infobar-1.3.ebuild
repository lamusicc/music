# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils

DESCRIPTION="Infobar plugin for DeadBeeF audio player. Shows lyrics and artist's biography for the current track."
HOMEPAGE="https://bitbucket.org/dsimbiriatin/deadbeef-infobar/wiki/Home"
SRC_URI="https://bitbucket.org/dsimbiriatin/${PN}/downloads/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND_COMMON="
	x11-libs/gtk+
	dev-libs/libxml2"

RDEPEND="
	${DEPEND_COMMON}
	media-sound/deadbeef[infobar]
	"
DEPEND="
	${DEPEND_COMMON}
	"

src_install() {
	cd deadbeef-infobar/
	insinto /usr/$(get_libdir)/deadbeef
	doins ddb_infobar.so
}
