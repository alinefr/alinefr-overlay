# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

DESCRIPTION="Forked driver for Ralink RT3290 Wi-Fi adapter"
HOMEPAGE="https://github.com/pkeeper/rt3290sta"
SRC_URI=""

inherit git-2 linux-mod

EGIT_REPO_URI="git://github.com/pkeeper/${PN}.git"

LICENSE="Unknown"
SLOT=0
KEYWORDS="~amd64"

MODULE_NAMES="rt3290sta(net/wireless:"${S}":"${S}"/os/linux)"

pkg_setup() {
	linux-mod_pkg_setup
}

src_compile() {
	eval unset ARCH
	emake
}

src_install() {
	linux-mod_src_install
}

pkg_postinst() {
	ewarn "if you have rt2800pci compiled as module, you SHOULD blacklist it!"
	ewarn "Add 'blacklist rt2800pci' to /etc/modprobe.d/blacklist.conf."
}
