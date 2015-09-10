# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

DESCRIPTION="Forked driver for Ralink RT3290 Wi-Fi adapter"
HOMEPAGE="https://github.com/pkeeper/rt3290sta"
SRC_URI=""

inherit git-2 linux-info linux-mod

EGIT_REPO_URI="git://github.com/pkeeper/${PN}.git"

LICENSE="Unknown"
SLOT=0
KEYWORDS="~amd64"

MODULE_NAMES="rt3290sta(net/wireless:"${S}":"${S}"/os/linux)"

pkg_setup() {
	get_version
	if linux_config_src_exists && linux_chkconfig_builtin "MODULES" ; then
		if linux_chkconfig_present "RT2800PCI" ; then
			warn_module=1
		fi
		linux-mod_pkg_setup
	elif linux_chkconfig_builtin "RT2800PCI" ; then
		die "Your kernel was built with CONFIG_RT2800PCI=y. Remove-it!"
	else
		die "Nonmodular kernel detected. This package needs a modular kernel."
	fi
}

src_compile() {
	eval unset ARCH
	emake
}

src_install() {
	linux-mod_src_install
}

pkg_postinst() {
	if [[ ${warn_module} -eq 1 ]]; then
		ewarn "You have rt2800pci compiled as module, you should blacklist it."
		ewarn "Add 'blacklist rt2800pci' to /etc/modprobe.d/blacklist.conf."
	fi
}
