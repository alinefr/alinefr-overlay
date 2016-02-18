# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

DESCRIPTION="Simple shutdown dialog."
HOMEPAGE="https://awesome.naquadah.org/wiki/ShutdownDialog"
SRC_URI=""

LICENSE="CC-BY-3.0"
SLOT=0
KEYWORDS="~amd64 ~x86"
S="${WORKDIR}"

DEPEND="
	gnome-extra/zenity
	sys-apps/dbus
	x11-misc/i3lock
	x11-libs/gksu
"

src_install() {
	dobin ${FILESDIR}/shutdown_dialog.sh
}
