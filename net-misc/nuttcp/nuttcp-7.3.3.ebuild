# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit autotools


DESCRIPTION="Nuttcp is a network performance measurement tool intended for use by network and system managers."
HOMEPAGE="http://www.nuttcp.net/"
SRC_URI="http://nuttcp.net/nuttcp/${P}/${P}.c"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S=${WORKDIR}

src_unpack()
{
	cp "${DISTDIR}"/nuttcp-${PV}.c ${PN}.c || die
}

src_compile() {
	tc-export CC
	emake nuttcp
}

src_install()
{
	dobin nuttcp
}

