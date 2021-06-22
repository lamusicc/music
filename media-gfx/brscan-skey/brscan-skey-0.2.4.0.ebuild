# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit versionator
#inherit ver_*

MY_PV=$(replace_version_separator 3 -)

DESCRIPTION="Brother scan key tool"
HOMEPAGE="http://brother.com"
SRC_URI="http://www.brother.com/pub/bsc/linux/dlf/${PN}-${MY_PV}.amd64.deb"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
DEPEND=""
RDEPEND="${DEPEND}"

src_unpack() {
	     unpack ${A}
	     unpack ./data.tar.gz
	     rm -f data.tar.gz
		 rm -f control.tar.gz
		 rm -f debian-binary
}


src_install() {
      cp -pPR * "${D}"/ || die "installing data failed"
}

pkg_postinst() {
	       ${ROOT}/opt/brother/scanner/brscan-skey/brscan-skey-0.2.4-0.sh 0
}

pkg_prerm() {
	    ${ROOT}/opt/brother/scanner/brscan-skey/brscan-skey-0.2.4-0.sh r
}

