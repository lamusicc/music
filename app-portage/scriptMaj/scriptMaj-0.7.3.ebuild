# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit eutils

DESCRIPTION="A script to upgrade your gentoo system support for baselayout 2 and no multilib profile"
HOMEPAGE="http://lamusic.dyndns.info/"
SRC_URI="http://lamusic.dyndns.info/ebuild/archive/${P}.tar.gz
http://server.lamusic.dyndns.info/ebuild/archive/${P}.tar.gz"


LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~ppc ~x86-fbsd"
IUSE="lafile layman gentoolkit"

DEPEND="app-shells/ansi-color
		app-portage/eix
		lafile? ( dev-util/lafilefixer )
		layman?	( app-portage/layman )
		gentoolkit? ( app-portage/gentoolkit )"

RDEPEND="${DEPEND}"

src_install() {
	if use !lafile && use !layman && use !gentoolkit ; then
		dobin scriptMaj_color || die
		dobin scriptMaj_menu || die
		dobin scriptMaj || die
	fi

	if use !lafile && use !layman && use gentoolkit ; then
		dobin scriptMaj_color || die
		dobin scriptMaj_menu || die
		dobin scriptMaj || die
		dobin scriptMaj_revdep || die
	fi

	if use !lafile && use layman && use gentoolkit ; then
		dobin scriptMaj_color || die
		dobin scriptMaj_menu || die
		dobin scriptMaj || die
		dobin scriptMaj_revdep || die
		dobin scriptMaj_layman || die
	fi

	if use lafile && use !layman && use !gentoolkit ; then
		dobin scriptMaj_color || die
		dobin scriptMaj_menu || die
		dobin scriptMaj || die
		dobin scriptMaj_lafile || die
	fi

	if use lafile && use !layman && use gentoolkit ; then
		dobin scriptMaj_color || die
		dobin scriptMaj_menu || die
		dobin scriptMaj || die
		dobin scriptMaj_lafile || die
		dobin scriptMaj_revdep || die
	fi


	if use lafile && use layman && use !gentoolkit ; then
		dobin scriptMaj_color || die
		dobin scriptMaj_menu || die
		dobin scriptMaj || die
		dobin scriptMaj_lafile || die
		dobin scriptMaj_layman || die
	fi

	if use lafile && use layman && use gentoolkit ; then
		dobin scriptMaj_color || die
		dobin scriptMaj_menu || die
		dobin scriptMaj || die
		dobin scriptMaj_lafile || die
		dobin scriptMaj_layman || die
		dobin scriptMaj_revdep || die
	fi

}
