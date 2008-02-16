# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="The pam_unix2 PAM module is for traditional password authentication. The advantages of this particular version are full SecureRPC and NIS+ support, HP-UX password aging, and password encryption with DES, bigcrypt, MD5, or blowfish. It allows the modification of user accounts in the source files for NIS maps on the NIS master server, if they are not the standard files in /etc."

HOMEPAGE="http://www.thkukuk.de/pam/pam_unix2/"
SRC_URI="ftp://ftp.suse.com/pub/people/kukuk/pam/pam_unix2/${P}.tar.bz2"
RESTRICT="nomirror"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86"

DEPEND=">=sys-libs/libxcrypt-2.0"
RDEPEND="${DEPEND}"

src_compile() {
	econf || die "bad configure"
	emake || die "compile problem"
}

src_install() {
	make DESTDIR=${D} install || die "install problem"
}

