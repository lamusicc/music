# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit mercurial

DESCRIPTION="Infobar plugin for DeadBeeF showing lyrics."
HOMEPAGE="https://bitbucket.org/dsimbiriatin/deadbeef-infobar/wiki/Home"
EHG_REPO_URI="https://bitbucket.org/dsimbiriatin/deadbeef-infobar"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="gtk2 gtk3"
REQUIRED_USE="|| ( ${IUSE} )"

DEPEND_COMMON="
	gtk2? ( media-sound/deadbeef[gtk] )
	gtk3? ( media-sound/deadbeef[gtk3] )
	x11-libs/gdk-pixbuf[jpeg]
	dev-libs/libxml2"

RDEPEND="${DEPEND_COMMON}"
DEPEND="${DEPEND_COMMON}"
S="${WORKDIR}"

src_compile() {
	if use gtk2; then
	  emake gtk2
	fi

	if use gtk3; then
	  emake gtk3
	fi
}

src_install() {
	if use gtk2; then
	  insinto /usr/$(get_libdir)/deadbeef
	  doins gtk2/ddb_infobar_gtk2.so
	fi

	if use gtk3; then
	  insinto /usr/$(get_libdir)/deadbeef
	  doins gtk3/ddb_infobar_gtk3.so
	fi
}

