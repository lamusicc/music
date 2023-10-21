# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

DESCRIPTION="Lib for colorise shell script."
HOMEPAGE="https://github.com/lamusicc"
SRC_URI="https://raw.github.com/lamusicc/archives/master/${P}.tar.bz2"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-shells/ansi-color"

RDEPEND="${DEPEND}"

src_install()
{
	dolib libBashColors || die
}
