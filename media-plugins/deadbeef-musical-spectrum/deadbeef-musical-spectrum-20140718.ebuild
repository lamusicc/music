# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

DEADBEEF_GUI="yes"

inherit deadbeef-plugins git-2

GITHUB_USERNAME="cboxdoerfer"
GITHUB_REPOSITORY="ddb_musical_spectrum"

DESCRIPTION="Musical Spectrum plugin for DeaDBeeF audio player"
HOMEPAGE="https://github.com/${GITHUB_USERNAME}/${GITHUB_REPOSITORY}"
EGIT_REPO_URI="https://github.com/${GITHUB_USERNAME}/${GITHUB_REPOSITORY}.git"
EGIT_COMMIT="0a3c1bbda201fe47a91a30ad1efa428dfa32d2cf"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~*"

RDEPEND="sci-libs/fftw:3.0"

DEPEND="${RDEPEND}"

src_prepare() {
	epatch "${FILESDIR}/${PN}-cflags.patch"
}

