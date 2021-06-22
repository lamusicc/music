# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit versionator

MY_PV=$(replace_version_separator 3 -)

DESCRIPTION="Brother scan key tool"
HOMEPAGE="http://brother.com"
SRC_URI="http://www.brother.com/pub/bsc/linux/dlf/${PN}-${MY_PV}.x86_64.rpm"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
DEPEND=""
RDEPEND="${DEPEND}"

src_unpack() {
		rpm_unpack "${A}" || die
}

src_install() {
      cp -pPR * "${D}"/ || die "installing data failed"
}

pkg_postinst() {
	       ${ROOT}/opt/brother/scanner/brscan-skey/brscan-skey-0.2.4-1.sh 0
}

pkg_prerm() {
	    ${ROOT}/opt/brother/scanner/brscan-skey/brscan-skey-0.2.4-1.sh r
}

