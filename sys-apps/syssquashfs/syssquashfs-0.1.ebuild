# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="Suite of bash script for make parts of system in squashfs."
HOMEPAGE="https://github.com/lamusicc"
SRC_URI="https://raw.github.com/lamusicc/archives/master/${P}.tar.bz2"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="sys-fs/squashfs-tools[gzip,lzma,lzo]
sys-fs/aufs3[kernel-patch]"

RDEPEND="${DEPEND}"

src_install()
{
	dobin syssquashfs_create || die
	dobin syssquashfs_update || die
	if [ ! -f /usr/lib/colors_bash_lib ] ; then
		dolib colors_bash_lib || die
	fi
	doconfd syssquashfsd || die
}

