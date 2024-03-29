# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit autotools eutils gnome2-utils

DESCRIPTION="ClipIt is a lightweight, fully featured GTK+ clipboard manager."
HOMEPAGE="http://sourceforge.net/projects/gtkclipit/"
SRC_URI="http://sourceforge.net/projects/gtkclipit/files/Version%201/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
}

src_configure() {
	econf --disable-dependency-tracking --disable-rpath
}

src_install() {
	emake DESTDIR="${D}" install || die
	dobin src/clipit || die "dobin failed"
	doman doc/clipit.1 || die "doman failed"
	dodoc AUTHORS NEWS README ABOUT-NLS
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	fdo-mime_desktop_database_update
}

pkg_postrm() {
	gnome2_icon_cache_update
	fdo-mime_desktop_database_update
}

