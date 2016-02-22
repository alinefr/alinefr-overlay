# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

DESCRIPTION="Helper script to make the Mutt mail client lookup credentials in Gnome keyring."
HOMEPAGE="https://github.com/wbolster/mutt-gnome-keyring"
SRC_URI=""

LICENSE="NONE"
SLOT=0
KEYWORDS="~amd64 ~x86"
S="${WORKDIR}"

DEPEND="
	gnome-base/gnome-keyring
	dev-python/gnome-keyring-python
	mail-client/mutt
"

src_install() {
	dobin ${FILESDIR}/mutt-gnome-keyring-password.py
}
