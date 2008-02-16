# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils


DESCRIPTION="Bluediving is a Bluetooth penetration testing suite"
HOMEPAGE="http://downloads.sourceforge.net/"
SRC_URI="http://downloads.sourceforge.net/bluediving/${P}.tgz"

LICENSE="GPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~ppc ~x86-fbsd"
IUSE=""


DEPEND="net-wireless/bluez-utils
dev-libs/libxml2"

RDEPEND="${DEPEND}"


src_unpack(){

	unpack ${A}
}

src_compile(){

	cd "${S}/tools"
	make  || die "einstall failed"
	cd "${S}/tools/carwhisperer-0.2"
	make  || die "einstall failed"
	cd "${S}/tools/bccmd_src"
	make  || die "einstall failed"
	cd "${S}/tools/btobex_src"
	make  || die "einstall failed"
	cd "${S}/tools/bss-0.8"
	make  || die "einstall failed"
	cd "${S}/tools/greenplaque_src"
	make  || die "einstall failed"
	cd "${S}/tools/hidattack01"
	make  || die "einstall failed"
}

src_install() {

	cd "${S}"
	dobin bluedivingNG.pl
	insinto /etc
	doins bluedivingNG.conf
	cd "${S}/tools"
	dobin atshell
	dobin attest
	dobin bdaddr
	dobin hcidump-crash
	dobin hstest
	dobin l2cap-packet
	dobin l2cap_headersize_overflow
	dobin rfcomm_shell
	cd "${S}/tools/carwhisperer-0.2"
	dobin carwhisperer
	cd "${S}/tools/bccmd_src"
	dobin bccmd
	cd "${S}/tools/btobex_src"
	dobin btobex
	cd "${S}/tools/bss-0.8"
	dobin bss
	cd "${S}/tools/greenplaque_src/src/"
	dobin greenplaque
	cd "${S}/tools/hidattack01"
	dobin hidattack

}




