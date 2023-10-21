# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit eutils

DESCRIPTION="Ansi Color is a simple bash shell script that makes it easy to color and format echo text."
HOMEPAGE="http://code.google.com/p/ansi-color/"
SRC_URI="https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/ansi-color/ansi-color-0.6.tar.gz"

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
