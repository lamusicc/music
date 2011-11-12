# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils


DESCRIPTION="BlueScanner searches out for Bluetooth-enabled devices"
HOMEPAGE="http://sourceforge.net/projects/bluescanner/"
SRC_URI="https://raw.github.com/lamusicc/archives/master/${P}.tar.gz"


LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~ppc ~x86-fbsd"
IUSE=""


DEPEND="net-wireless/bluez-utils"
RDEPEND="${DEPEND}"


src_install() {
	dobin bluescan || die
}

