# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit autotools git-r3

EGIT_REPO_URI="git://github.com/Evolix/uvrrpd"

DESCRIPTION="uvrrpd is a VRRP daemon written in C, providing an full implementation of VRRPv2 (rfc3768) and VRRPv3 (rfc5798), with IPv4 and IPv6 support."
HOMEPAGE="https://github.com/Evolix/uvrrpd"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare()
{
	eautoreconf -i
}

src_configure()
{
	if [[ -x ${ECONF_SOURCE:-.}/configure ]] ; then
		econf
	fi
}

src_install()
{
	emake \
		DESTDIR="${D}" \
	docdir="${EPREFIX}"/usr/share/doc/${PF} \
	install
}

