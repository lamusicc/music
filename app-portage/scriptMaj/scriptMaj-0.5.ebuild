# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="A script to upgrade your gentoo system support for baselayout 2 and no multilib profile"
HOMEPAGE="http://lamusic.dyndns.info/"
SRC_URI="http://lamusic.dyndns.info/ebuild/archive/${P}.tar.gz
http://server.lamusic.dyndns.info/ebuild/archive/${P}.tar.gz"


LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~ppc ~x86-fbsd"
IUSE=""

DEPEND="app-portage/layman
		app-portage/eix"

RDEPEND="${DEPEND}"


src_install() {
	dobin scriptMaj || die
}

