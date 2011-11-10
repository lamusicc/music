# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit perl-module flag-o-matic git-2

EGIT_REPO_URI="git://git.irssi.org/irssi"
EGIT_MASTER="trunk"
EGIT_BRANCH="trunk"
EGIT_BOOTSTRAP="TZ=UTC git log >\"\${S}\"/ChangeLog ; NOCONFIGURE=1 ./autogen.sh"

DESCRIPTION="A modular textUI IRC client with IPv6 support"
HOMEPAGE="http://irssi.org/"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~hppa ~mips ~ppc ~sparc ~x86 ~x86-fbsd"
IUSE="ipv6 perl ssl socks5"

RDEPEND="sys-libs/ncurses
		>=dev-libs/glib-2.2.1
		ssl? ( dev-libs/openssl )
		perl? ( dev-lang/perl )
		socks5? ( >=net-proxy/dante-1.1.18 )"

DEPEND="${RDEPEND}
		>=dev-util/pkgconfig-0.9.0
		>=sys-devel/autoconf-2.58
		dev-lang/perl
		www-client/lynx"

RDEPEND="${RDEPEND}
		perl? ( !net-im/silc-client )
		!net-irc/irssi"

src_configure() {
	epunt_cxx
	econf \
		--with-proxy \
		--with-ncurses \
		--with-perl-lib=vendor \
		$(use_with perl) \
		$(use_with socks5 socks) \
		$(use_enable ssl) \
		$(use_enable ipv6) \
		|| die "econf failed"
}

src_compile() {
	emake || die "emake failed"
}

src_install() {
	emake \
		DESTDIR="${D}" \
		docdir=/usr/share/doc/${PF} \
		install || die "make install failed"

	use perl && fixlocalpod

	dodoc AUTHORS README TODO NEWS || die "dodoc failed"
}