# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-2 cmake-utils

DESCRIPTION="Spotify client running as a daemon, similar to mpd."
HOMEPAGE="https://github.com/Schnouki/spop"
SRC_URI=""

EGIT_REPO_URI="git://github.com/Schnouki/${PN}.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+ao awesome dbus gio libnotify oss savestate soup sox"

REQUIRED_USE="awesome? ( dbus ) 
			  savestate? ( soup )
			  "

RDEPEND="
	dev-libs/libspotify
	dev-libs/json-glib
	dev-lua/luasocket 
	ao? ( media-libs/libao )
	sox? ( media-sound/sox )
	gio? ( dev-libs/glib )	
	libnotify? ( x11-libs/libnotify )
	soup? ( net-libs/libsoup )
	"
DEPEND="${RDEPEND}"

DOCS=( {README,CONTRIBUTORS}.md COPYING )

BUILD_DIR="${S}/build"

src_prepare() {
	epatch "${FILESDIR}/${PN}-cmake-options.patch"

	epatch_user
}

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_enable ao AO)
		$(cmake-utils_use_enable sox SOX)
		$(cmake-utils_use_enable oss OSS)
		$(cmake-utils_use_enable dbus DBUS)
		$(cmake-utils_use_enable awesome AWESOME)
		$(cmake-utils_use_enable gio GIO)
		$(cmake-utils_use_enable libnotify NOTIFY)
	)

	cmake-utils_src_configure
}

src_compile() {
	cd build || die
	cmake-utils_src_compile
}

src_install() {
	cmake-utils_src_install
	insinto ${EPREFIX}/share/spop
	doins spopd.conf.sample
}

pkg_postinst() {
	einfo "Copy ${EPREFIX}/share/spop/spopd.conf.sample to ~/.config/spop/spopd.conf."
}
