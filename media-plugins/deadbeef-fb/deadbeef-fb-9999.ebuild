# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit eutils git-r3

DESCRIPTION="DeaDBeeF filebrowser plugin "
HOMEPAGE="https://sourceforge.net/projects/deadbeef-fb/"
#EGIT_REPO_URI="git://git.code.sf.net/p/deadbeef-fb/code"
EGIT_REPO_URI="https://gitlab.com/zykure/deadbeef-fb.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="gtk2 gtk3"

DEPEND_COMMON="
	gtk2? ( media-sound/deadbeef[gtk] )
	gtk3? ( media-sound/deadbeef[gtk3] )"

RDEPEND="${DEPEND_COMMON}"
DEPEND="${DEPEND_COMMON}"

#S="${WORKDIR}/deadbeef-devel"
S="${WORKDIR}/deadbeef-fb-9999"

src_configure() {
	./autogen.sh
	my_config="--disable-static
		$(use_enable gtk3)
		$(use_enable gtk2)"
	econf ${my_config}
}

src_install() {
	emake DESTDIR="${D}" install
	find "${D}" -name "${PN}-${PV}" -exec rm -rf {} +
}
