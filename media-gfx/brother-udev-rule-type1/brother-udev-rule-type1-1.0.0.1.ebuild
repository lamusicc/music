# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit versionator

MY_PV=$(replace_version_separator 3 -)

DESCRIPTION="Brother scan key tool"
HOMEPAGE="http://brother.com"
SRC_URI="http://www.brother.com/pub/bsc/linux/dlf/${PN}-${MY_PV}.noarch.rpm"
LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""
DEPEND=""
RDEPEND="${DEPEND}"

src_unpack() {
		rpm_unpack "${A}" || die
}

src_install() {
      cp -pPR * "${D}"/ || die "installing data failed"
}

