# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"


EGIT_REPO_URI="git://gist.github.com/fa6258f3ff7b17747ee3.git"
inherit git-r3

DESCRIPTION="CLI client for Spotify Linux"
HOMEPAGE="https://gist.github.com/streetturtle/fa6258f3ff7b17747ee3"

LICENSE="MIT"
SLOT=0
KEYWORDS="~amd64"

RDEPEND="media-sound/spotify"
DEPEND="${RDEPEND}"

src_install() {
	dobin sp
}
