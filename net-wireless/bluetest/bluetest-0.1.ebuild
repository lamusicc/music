# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit eutils

DESCRIPTION="BlueTest is a Perl script designed to do data extraction from vulnerable Bluetooth-enabled devices."
HOMEPAGE="http://packetstorm.linuxsecurity.com/"
SRC_URI="https://raw.github.com/lamusicc/archives/master/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~ppc ~x86-fbsd"
IUSE=""

DEPEND="net-wireless/bluez-utils"
RDEPEND="${DEPEND}"

src_install() {
	dobin bluetest || die
}
