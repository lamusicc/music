# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gnome2 autotools

DESCRIPTION="Midori is a lightweight web browser using WebKit"
HOMEPAGE="http://software.twotoasts.de/?page=midori"
SRC_URI="http://software.twotoasts.de/media/midori/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=x11-libs/gtk+-2.6
	     >=net-libs/webkitgtk-29723
	     x11-libs/libsexy
	     dev-libs/libxml2"

RDEPEND="${DEPEND}"

src_unpack() {
	unpack ${A}
	cd "${S}"

	# find webkit
	sed -i -e 's@WebKitGtk@webkit-1.0@g' configure.in
	# fix includes
	find ./src -type f | xargs \
		sed -i -e 's@webkit.h@webkit/webkit.h@g'
	
	eautoreconf
}

