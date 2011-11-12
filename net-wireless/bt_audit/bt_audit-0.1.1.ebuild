# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit eutils

DESCRIPTION="BTAudit is a set of programs and scripts for auditing Bluetooth-enabled devices."
HOMEPAGE="http://www.betaversion.net/"
SRC_URI="http://www.betaversion.net/btdsd/download/${P}.tar.gz"

LICENSE="GPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~ppc ~x86-fbsd"
IUSE=""

S="${WORKDIR}/bt_audit"

DEPEND="net-wireless/bluez-utils"
RDEPEND="${DEPEND}"

src_unpack(){
	unpack ${A}
}

src_compile(){
	cd "${S}/src"
	make  || die "einstall failed"
}

src_install() {
	cd "${S}/src"
	dobin psm_scan
	dobin rfcomm_scan
}
