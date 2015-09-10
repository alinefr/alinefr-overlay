# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

DESCRIPTION="Forked driver for Ralink RT3290 Wi-Fi adapter"
HOMEPAGE="https://github.com/pkeeper/rt3290sta"
SRC_URI=""

inherit eutils git-2

EGIT_REPO_URI="git://github.com/pkeeper/${PN}.git"

LICENSE="Unknown"
SLOT=0
KEYWORDS="~amd64"

src_prepare() {
    epatch "${FILESDIR}/${PN}-destdir.patch"
}

src_compile() {
	eval unset ARCH
	emake
}
