# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit git-2 autotools

EGIT_REPO_URI="git://github.com/yaddns/yaddns.git"
EGIT_MASTER="master"
EGIT_BRANCH="master"
#EGIT_COMMIT=""

DESCRIPTION="ddns is a small ddns client with multiple ddns server supports and a high flexibility."
HOMEPAGE="http://yaddns.github.com/"
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug"

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
}

src_configure() {
	my_config="
	--disable-dependency-tracking
	$(use_enable debug)"
	econf ${my_config} || die
}

src_install() {
	einstall
	insinto /etc
	newins etc/yaddns.conf yaddns.conf
}
