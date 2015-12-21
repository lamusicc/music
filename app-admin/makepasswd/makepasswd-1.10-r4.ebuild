# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit eutils

DESCRIPTION="Random password generator with freebsd md5 and openssl random."
HOMEPAGE="http://packages.debian.org/sid/admin/makepasswd"
SRC_URI="mirror://debian/pool/main/m/makepasswd/${P/-/_}.orig.tar.gz
mirror://debian/pool/main/m/makepasswd/${PN}_1.10-8.diff.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 ia64 ppc s390 sparc x86 ~x86-interix ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos ~sparc-solaris ~x86-solaris"
IUSE=""

RDEPEND="dev-lang/perl
dev-perl/Crypt-PasswdMD5
dev-perl/Crypt-OpenSSL-Random"

src_unpack() {
	unpack "${P/-/_}.orig.tar.gz" && unpack "${PN}_1.10-8.diff.gz"
	epatch "${WORKDIR}"/${PN}_1.10-8.diff
}

src_install() {
	dobin makepasswd || die
	doman makepasswd.1
	dodoc README CHANGES
}
