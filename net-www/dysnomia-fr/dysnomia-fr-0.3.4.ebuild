# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils


DESCRIPTION="download music and other french version"
HOMEPAGE="http://dysnomia-project.org/"
SRC_URI="http://dysnomia-project.org/${P}.tgz"


LICENSE="GPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~ppc ~x86-fbsd"
IUSE=""

DEPEND="x11-libs/wxGTK
net-misc/curl"

RDEPEND="${DEPEND}"

src_unpack(){

	unpack ${A}.tgz

}

src_compile() {
	cd ${S}
	make || die "einstall failed"

}

src_install(){

	dodir /usr/bin
	dobin dysnomia

}

