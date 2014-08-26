# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

DEADBEEF_GUI="yes"

inherit cmake-utils deadbeef-plugins

GITHUB_USERNAME="scorpp"
GITHUB_REPOSITORY="db-vk"

DESCRIPTION="DeadBeef plugin for listening music from vkontakte.com"
HOMEPAGE="https://github.com/${GITHUB_USERNAME}/${GITHUB_REPOSITORY}"
SRC_URI="https://github.com/${GITHUB_USERNAME}/${GITHUB_REPOSITORY}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~*"

RDEPEND="dev-libs/json-glib
	media-sound/deadbeef[curl]"

DEPEND="${RDEPEND}"

S="${WORKDIR}/${GITHUB_REPOSITORY}-${PV}"

src_configure() {
	mycmakeargs="
		$(cmake-utils_use_with gtk2 GTK2)
		$(cmake-utils_use_with gtk3 GTK3)"

	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile
}

