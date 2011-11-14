# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit eutils

DESCRIPTION="A script to upgrade your gentoo system support for baselayout 2 and no multilib profile."
HOMEPAGE="http://lamusic.dyndns.info/"
SRC_URI="https://raw.github.com/lamusicc/archives/master/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~ppc ~x86-fbsd"
IUSE=""

DEPEND="app-shells/ansi-color
app-portage/eix
dev-util/lafilefixer
app-portage/layman
app-portage/gentoolkit"

RDEPEND="${DEPEND}"

src_install()
{
	dobin scriptMaj || die
}
