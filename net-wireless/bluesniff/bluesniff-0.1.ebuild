# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils


DESCRIPTION="BlueSniff is a GUI-based utility for finding discoverable and hidden Bluetooth-enabled devices"
HOMEPAGE="http://bluesniff.shmoo.com/"
SRC_URI="http://bluesniff.shmoo.com/${P}.tar.gz"


LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~ppc ~x86-fbsd"
IUSE=""


DEPEND="net-wireless/bluez-utils"
RDEPEND="${DEPEND}"


src_install() {
	dobin bluesniff.pl || die
}

