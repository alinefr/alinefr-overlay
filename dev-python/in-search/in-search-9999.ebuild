# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 git-r3

DESCRIPTION="A plugin to search torrents without leaving Deluge."
HOMEPAGE="https://github.com/matiasb/in-search"
SRC_URI=""

EGIT_REPO_URI="git://github.com/matiasb/${PN}.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DOCS=( readme.md INSTALL )

DEPEND=""
RDEPEND="${DEPEND}
	net-p2p/deluge"

python_install_all() {
	distutils-r1_python_install_all
	esetup.py bdist_egg
	PY_VER=$(echo ${EPYTHON} | sed -e 's/python//' -e 's/_/\./')
	insinto "${EPREFIX}/usr/$(get_libdir)/${EPYTHON}/site-packages/deluge/plugins"
	doins "${BUILD_DIR}/dist/$(esetup.py --fullname)-py${PY_VER}.egg"
}
