# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils


DESCRIPTION="BlueBugger exploits the BlueBug vulnerability"
HOMEPAGE="http://www.remote-exploit.org/"
SRC_URI="http://www.remote-exploit.org/codes/bluebugger/${P}.tar.gz"

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

	dobin bluebugger
}


