# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils


DESCRIPTION="Patching your ipw2200 driver 1.2.2 for injection fs 2.6.23 and later"
HOMEPAGE="http://lamusic.dyndns.info/"
SRC_URI="http://lamusic.dyndns.info/ebuild/archive/${P}.tar.gz
http://server.lamusic.dyndns.info/ebuild/archive/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dobin autoPatchIpw || die
}

