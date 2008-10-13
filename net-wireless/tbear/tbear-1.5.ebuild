# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils


DESCRIPTION="Transient Bluetooth Environment Auditor"
HOMEPAGE="http://freshmeat.net/"
SRC_URI="http://freshmeat.net/redir/t-bear/67412/url_tgz/${PN}.tar.gz"

LICENSE="GPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~ppc ~x86-fbsd"
IUSE=""


DEPEND="net-wireless/bluez-utils"
RDEPEND="${DEPEND}"


src_unpack(){

	unpack ${A}
}

src_compile(){

	make  || die "einstall failed"
}

src_install() {

	dobin tbear
	dobin tbsearch
	dobin tanya
}


