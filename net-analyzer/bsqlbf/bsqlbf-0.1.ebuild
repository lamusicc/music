# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $


inherit eutils


DESCRIPTION="bsqlbf is a Perl script that lets auditors retrieve information from web sites that are vulnerable to SQL Injection"
HOMEPAGE="http://www.unsec.net/"
SRC_URI="http://lamusic.dyndns.info/ebuild/archive/${P}.tar.gz
http://server.lamusic.dyndns.info/ebuild/archive/${P}.tar.gz"


LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~ppc ~x86-fbsd"
IUSE=""


DEPEND="dev-lang/perl"
RDEPEND="${DEPEND}"


src_install() {
	dobin bsqlbf || die
}

