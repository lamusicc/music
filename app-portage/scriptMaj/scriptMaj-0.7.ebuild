# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils

DESCRIPTION="A script to upgrade your gentoo system support for baselayout 2 and no multilib profile"
HOMEPAGE="http://lamusic.dyndns.info/"
SRC_URI="http://lamusic.dyndns.info/ebuild/archive/${P}.tar.gz
http://server.lamusic.dyndns.info/ebuild/archive/${P}.tar.gz"


LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~ppc ~x86-fbsd"
IUSE="lafile layman"

DEPEND="app-shells/ansi-color
		app-portage/eix
		lafile? ( dev-util/lafilefixer )
		layman?	( app-portage/layman )"

RDEPEND="${DEPEND}"

src_prepare() {
	if use !lafile && use !layman ; then
		epatch "${FILESDIR}/no_lafilefixer_no_layman.patch"
	fi

	if use !lafile && use layman ; then
		epatch "${FILESDIR}/no_lafilefixer.patch"
	fi

	if use lafile && use !layman ; then
		epatch "${FILESDIR}/no_layman.patch"
	fi
}
		
src_install() {
	dobin scriptMaj || die
}

