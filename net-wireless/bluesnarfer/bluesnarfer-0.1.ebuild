# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils


DESCRIPTION="Bluesnarfer will download the phone-book of any mobile device vulnerable to Bluesnarfing"
HOMEPAGE="http://www.alighieri.org/"
SRC_URI="http://www.alighieri.org/tools/${PN}.tar.gz"

LICENSE="GPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~ppc ~x86-fbsd"
IUSE=""

S="${WORKDIR}/bluesnarfer"


DEPEND="net-wireless/bluez-utils"
RDEPEND="${DEPEND}"


src_unpack(){
	unpack ${A}
}

src_compile(){
	cd "${S}"
	make  || die "einstall failed"
}

src_install() {
	cd "${S}/src"
	dobin bluesnarfer
}


