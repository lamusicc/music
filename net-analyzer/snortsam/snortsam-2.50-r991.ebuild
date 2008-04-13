# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

MY_P="${PN}-src-${PV}"
DESCRIPTION="Snort plugin that allows automated blocking of IP addresses on several firewalls with baselayout 2 support"
HOMEPAGE="http://www.snortsam.net/"
SRC_URI="http://www.snortsam.net/files/snortsam/${MY_P}.tar.gz
		 mirror://gentoo/${PN}-2.50-ciscoacl.diff.bz2"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~alpha amd64 ppc ppc64 sparc x86"
IUSE=""

DEPEND=""

RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}"

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}"/${PN}-2.29-no-ugly----lines.diff
	# bug 155955, ciscoacl segfaults with gcc-4.1.1
	epatch "${DISTDIR}"/${PN}-2.50-ciscoacl.diff.bz2
	epatch "${FILESDIR}"/makesnortsam.sh.baselayout2.patch
}

src_compile() {
	sed -i "s: -O2 : ${CFLAGS} :" makesnortsam.sh || die "sed failed"
	sh makesnortsam.sh || die "makesnortsam.sh failed"
}

src_install() {
	find "${S}" -type d -name CVS -exec rm -rf {} \;
	find "${S}" -type f -name "*.asc" -exec rm -f {} \;
	dobin snortsam || die "dobin failed"
	dodoc docs/* conf/*
}

pkg_postinst() {
	elog
	elog "To use snortsam with snort, you'll have to compile snort with USE=snortsam."
	elog "Read the INSTALL file to configure snort for snortsam, and configure"
	elog "snortsam for your particular firewall."
	elog

}

