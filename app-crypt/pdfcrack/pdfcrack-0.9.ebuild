# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="pdf cracker"
HOMEPAGE="http://downloads.sourceforge.net/pdfcrack/"
SRC_URI="http://downloads.sourceforge.net/pdfcrack/${P}.tar.gz"

LICENSE="GPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~ppc ~x86-fbsd"
IUSE=""


DEPEND=""

RDEPEND="${DEPEND}"

src_unpack(){
	unpack ${A}
}

src_compile(){
	emake  || die "einstall failed"
}

src_install() {
	dobin pdfcrack
}

