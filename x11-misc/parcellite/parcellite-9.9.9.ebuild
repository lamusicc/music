# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit fdo-mime autotools subversion

ESVN_REPO_URI="https://parcellite.svn.sourceforge.net/svnroot/parcellite/trunk"
ESVN_PROJECT="parcellite"
#ESVN_BOOTSTRAP="./autogen.sh"

DESCRIPTION="A lightweight GTK+ based clipboard manager."
HOMEPAGE="http://parcellite.sourceforge.net/"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="nls"

RDEPEND=">=x11-libs/gtk+-2.10:2
>=dev-libs/glib-2.14:2"
DEPEND="${RDEPEND}
dev-util/pkgconfig
nls? ( sys-devel/gettext
dev-util/intltool )"

src_prepare() {
	# Doh! Tarballs contains compiled target
	emake clean
	eautoreconf
}

src_configure() {
	econf \
		--disable-dependency-tracking \
		$(use_enable nls)
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc AUTHORS ChangeLog NEWS README TODO
}

pkg_postinst() {
	fdo-mime_desktop_database_update
}

pkg_postrm() {
	fdo-mime_desktop_database_update
}
