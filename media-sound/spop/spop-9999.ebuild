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

DEPEND=""
RDEPEND="
	dev-libs/libspotify
	dev-libs/json-glib
	"

DOCS=( {README,CONTRIBUTORS}.md COPYING )

BUILD_DIR="${S}/build"

src_configure() {
	local mycmakeargs=(
		-DCMAKE_INSTALL_PREFIX=/usr
	)

	cmake-utils_src_configure
}

src_compile() {
	cd build || die
	cmake-utils_src_compile
}

src_install() {
	cmake-utils_src_install
	insinto /usr/share/spop
	doins spopd.conf.sample
}
