# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $


inherit eutils


DESCRIPTION="A script for maj your gentoo system"
HOMEPAGE="http://lamusic.dyndns.info/"
SRC_URI="http://lamusic.dyndns.info/ebuild/archive/${P}.tar.gz
http://server.lamusic.dyndns.info/ebuild/archive/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="app-portage/layman"

RDEPEND="${DEPEND}"

src_install() {
	dobin emerge-e17 || die
}

