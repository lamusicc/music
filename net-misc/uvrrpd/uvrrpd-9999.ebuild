# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit autotools git-r3

EGIT_REPO_URI="https://forge.evolix.org/uvrrpd.git"

DESCRIPTION="uvrrpd is a VRRP daemon written in C, providing an full implementation of VRRPv2 (rfc3768) and VRRPv3 (rfc5798), with IPv4 and IPv6 support."
HOMEPAGE="https://github.com/Evolix/uvrrpd"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

