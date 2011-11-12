# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

EAPI=3

DESCRIPTION="Ansi Color is a simple bash shell script that makes it easy to color and format echo'd text."
HOMEPAGE="http://code.google.com/p/ansi-color/"
SRC_URI="http://ansi-color.googlecode.com/files/ansi-color-0.6.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="app-shells/bash"
RDEPEND="${DEPEND}"

src_install() {
	cd "${S}"
	dobin color || die
	doman color.1 || die
}

