# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit eutils git

EGIT_REPO_URI="git://repo.or.cz/ncmpcpp.git"
EGIT_TREE="HEAD"
EGIT_BOOTSTRAP="./autogen.sh"

DESCRIPTION="An ncurses mpd client, ncmpc clone with some new features, written in C++"
HOMEPAGE="http://unkart.ovh.org/ncmpcpp"
SRC_URI=""

LICENSE="GPL-2"
IUSE="clock curl taglib unicode"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="sys-libs/ncurses[unicode?]
	curl? ( net-misc/curl )
	taglib? ( media-libs/taglib )"
RDEPEND="$DEPEND"

src_configure() {
	econf $(use_enable unicode) $(use_enable clock) \
		$(use_with curl) $(use_with taglib)
}

src_install() {
	emake install DESTDIR="${D}" docdir="/usr/share/doc/${PF}" \
		|| die "install failed"
	prepalldocs
}

pkg_postinst() {
	echo
	elog "Example configuration files have been installed at"
	elog "${ROOT}usr/share/doc/${PF}"
	elog "${P} uses ~/.ncmpcpp/config and ~/.ncmpcpp/keys"
	elog "as user configuration files."
	echo
	elog "This version of ncmpcpp uses features from mpd-0.14, so"
	elog "we recommend you use this with >=mpd-0.14_alpha1."
	echo
	elog "The color syntax has changed, see the example config file"
	elog "for the new syntax."
	echo
}
