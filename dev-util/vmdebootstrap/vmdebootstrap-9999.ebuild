# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

PYTHON_COMPAT=( python2_7 pypy )

inherit git-r3

EGIT_REPO_URI="git://git.liw.fi/${PN}.git"

DESCRIPTION="Installs a basic Debian system into a disk image."
HOMEPAGE="http://liw.fi/vmdebootstrap/"

LICENSE="GPL3"
SLOT=0
KEYWORDS="~amd64"

RDEPEND=""
DEPEND="${RDEPEND}"
