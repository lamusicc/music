# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="7"

inherit eutils

DESCRIPTION="A script to upgrade your gentoo system support for baselayout 2 and no multilib profile."
HOMEPAGE="https://github.com/lamusicc"
SRC_URI="https://raw.github.com/lamusicc/archives/master/${P}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~ppc ~x86-fbsd"
IUSE=""

DEPEND="app-portage/eix
		app-portage/layman
		app-portage/gentoolkit
		dev-util/libBashColors"

RDEPEND="${DEPEND}"

src_install()
{
	dobin scriptMaj || die
	dolib scriptMaj_function || die
}

