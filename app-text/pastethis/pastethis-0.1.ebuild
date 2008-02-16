# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $


inherit eutils


DESCRIPTION="command-line interface to pastebin.com written by Co2"
HOMEPAGE="http://lamusic.dyndns.info/"
SRC_URI="http://lamusic.dyndns.info/ebuild/archive/${P}.tar.gz
http://server.lamusic.dyndns.info/ebuild/archive/${P}.tar.gz"


LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~alpha ~hppa ~ia64 ~ppc ~ppc64 ~sparc-fbsd ~sparc ~x86-fbsd"
IUSE=""


DEPEND="dev-lang/ruby"
RDEPEND="${DEPEND}"


src_install() {
	dobin pastethis || die
}

