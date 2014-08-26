# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit deadbeef-plugins git-2

GITORIOUS_PROJECT="deadbeef-sm-plugins"
GITORIOUS_REPOSITORY="stereo-widener"

DESCRIPTION="A simple stereo widener plugin for DeaDBeeF."
HOMEPAGE="https://gitorious.org/${GITORIOUS_PROJECT}/${GITORIOUS_REPOSITORY}"
EGIT_REPO_URI="git://gitorious.org/${GITORIOUS_PROJECT}/${GITORIOUS_REPOSITORY}.git"
EGIT_COMMIT="d3990d772b02cdc6206f067748f5d1f9650616fb"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~*"


src_prepare() {
	epatch "${FILESDIR}/${PN}.patch"
}

