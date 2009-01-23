# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit eutils

DESCRIPTION="Ossvol is a simple volume management script for OSS."
HOMEPAGE="http://ossvol.sourceforge.net/"
#SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"
SRC_URI="http://lamusic.dyndns.info/ebuild/archive/${P}.tar.gz
http://server.lamusic.dyndns.info/ebuild/archive/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~ppc ~x86-fbsd"
IUSE=""

DEPEND="|| ( media-sound/oss media-sound/oss-devel )"
RDEPEND=""

src_unpack() {
	unpack "${A}"
}

src_install() {
	dobin ossvol || die
}

