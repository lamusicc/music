# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit font

FONT_S="${S}"
FONTDIR="/usr/share/fonts/indic/oriya"
FONT_SUFFIX="ttf fea sfd"

DESCRIPTION="The Lohit family of Indic fonts"
HOMEPAGE="https://fedorahosted.org/lohit"
LICENSE="GPL-2"
SRC_URI="https://fedorahosted.org/releases/l/o/lohit/${P}.tar.gz"

SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="media-gfx/fontforge"
RDEPEND="${DEPEND}"

DOCS="AUTHORS ChangeLog README"

RESTRICT="test binchecks"

src_install() {
	FONT_CONF=( $(find "${FONT_S}" -name *.conf -print) )
	find "${S}" -name "*.ttf" -exec cp "{}" . \;
	font_src_install
}
