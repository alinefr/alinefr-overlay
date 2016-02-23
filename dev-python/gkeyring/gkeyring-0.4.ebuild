# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python2_7 pypy )

inherit distutils-r1

DESCRIPTION="A small Python tool for shell access to GNOME keyring. It provides simple querying for and creating of keyring items."
HOMEPAGE="https://pypi.python.org/pypi/gkeyring"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DOCS=( README.rst )

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/gnome-keyring-python"
