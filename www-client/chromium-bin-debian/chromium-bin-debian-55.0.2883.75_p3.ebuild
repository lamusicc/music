# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils multilib unpacker

MY_PV=${PV/_p/-}
MY_PN=${PN%%-bin-debian}

DESCRIPTION="Chromium build from Debian unstable"
HOMEPAGE="http://packages.debian.org/sid/chromium"
SRC_URI="mirror://debian/pool/main/${PN:0:1}/${PN:0:8}-browser/${PN:0:8}_${MY_PV}_amd64.deb
	mirror://debian/pool/main/c/crystalhd/libcrystalhd3_0.0~git20110715.fdd2f19-11_amd64.deb
	mirror://debian/pool/main/f/ffmpeg/libavcodec57_3.2-2_amd64.deb
	mirror://debian/pool/main/f/ffmpeg/libavformat57_3.2-2_amd64.deb
	mirror://debian/pool/main/f/ffmpeg/libavutil55_3.2-2_amd64.deb
	mirror://debian/pool/main/f/ffmpeg/libswresample2_3.2-2_amd64.deb
	mirror://debian/pool/main/i/icu/libicu57_57.1-5_amd64.deb
	mirror://debian/pool/main/libe/libevent/libevent-2.0-5_2.0.21-stable-2.1_amd64.deb
	mirror://debian/pool/main/libs/libssh/libssh-gcrypt-4_0.7.3-1_amd64.deb
	mirror://debian/pool/main/n/numactl/libnuma1_2.0.11-1_amd64.deb
	mirror://debian/pool/main/r/re2/libre2-3_20161101+dfsg-2_amd64.deb
	mirror://debian/pool/main/s/shine/libshine3_3.1.0-2.1_amd64.deb
	"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="app-arch/dpkg"
RDEPEND="
	app-accessibility/speech-dispatcher
	app-arch/snappy
	app-crypt/mit-krb5
	dev-libs/atk
	dev-libs/expat
	dev-libs/glib:2
	!dev-libs/icu:0/57
	dev-libs/libevent
	dev-libs/libxml2
	dev-libs/libxslt
	dev-libs/nspr
	dev-libs/nss
	gnome-base/libgnome-keyring
	media-libs/alsa-lib
	media-libs/flac
	media-libs/fontconfig
	media-libs/freetype
	media-libs/game-music-emu
	media-libs/harfbuzz
	media-libs/libbluray
	>=media-libs/libjpeg-turbo-1.3.1
	media-libs/libpng:0/16
	media-libs/libvpx:0/4
	media-libs/libwebp:0/6
	media-libs/openjpeg:0/5
	media-libs/schroedinger
	media-libs/soxr
	media-libs/x265
	media-libs/zvbi
	>=media-sound/pulseaudio-2.0
	media-sound/twolame
	media-sound/wavpack
	net-print/cups
	sys-apps/dbus
	>=sys-devel/gcc-4.9:*[cxx]
	sys-libs/zlib
	x11-libs/cairo
	x11-libs/gdk-pixbuf
	x11-libs/gtk+
	x11-libs/libva
	x11-libs/libvdpau
	x11-libs/libX11
	x11-libs/libXScrnSaver
	x11-libs/libxcb
	x11-libs/libXcomposite
	x11-libs/libXcursor
	x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libXi
	x11-libs/libXrandr
	x11-libs/libXrender
	x11-libs/libXtst
	x11-libs/pango
	"

S=${WORKDIR}

src_prepare() {
	epatch "${FILESDIR}"/${PN}-53.0.2785.143_p1-gentoo.patch
}

src_install() {
	mv usr etc "${D}"/ || die

	local libdir=$(get_libdir)
	[[ "${libdir}" != lib ]] && {
		mv "${D}"/usr/{lib,"${libdir}"} || die
	}

	# Make it find ffmpeg
	mv "${D}"/usr/${libdir}/x86_64{-linux-gnu,} || die

	# Link to Flash (not in RDEPEND)
	local flash_plugin_dir=/usr/${libdir}/firefox/plugins
	dodir "${flash_plugin_dir}"
	ln -s ../../nsbrowser/plugins/libflashplayer.so "${D}"/${flash_plugin_dir}/libflashplayer.so || die

	# Otherwise:
	# [14345:14345:0708/125539:FATAL:zygote_host_impl_linux.cc(140)]
	# The SUID sandbox helper binary was found, but is not configured correctly.
	# Rather than run without sandboxing I'm aborting now. You need to make sure
	# that /usr/lib/chromium/chromium-sandbox is owned by root and has mode 4755.
	# Aborted
	chmod 4755 "${D}"/usr/${libdir}/${MY_PN}/chrome-sandbox || die
}
