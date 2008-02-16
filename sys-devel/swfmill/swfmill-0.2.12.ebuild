# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="swfmill is an xml2swf and swf2xml processor with import
functionalities."
HOMEPAGE="http://swfmill.org/";
SRC_URI="http://swfmill.org/releases/${P}.tar.gz";

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-libs/libxml2
dev-libs/libxslt
sys-libs/zlib
media-libs/freetype
media-libs/libpng"
RDEPEND="$DEPEND"


src_compile() {
	econf || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "install failed"
	dodoc AUTHORS COPYING INSTALL NEWS README TODO
}

