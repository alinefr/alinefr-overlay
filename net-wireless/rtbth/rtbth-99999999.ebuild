# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"
inherit linux-info linux-mod

if [[ ${PV} == 99999999* ]]; then
	EGIT_REPO_URI="git://github.com/alinefr/${PN}.git"
	inherit git-r3
else
	SRC_URI="http://github.com/alinefr/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi

DESCRIPTION="rtbth bluetooth kernel driver for Ralink RT3290 adapter"
HOMEPAGE="https://github.com/alinefr/rtbth"

LICENSE="GPL2"
SLOT=0
KEYWORDS="~amd64"
IUSE="pm-utils"

RDEPEND="pm-utils? ( sys-power/pm-utils )"
DEPEND="${RDEPEND}"

MODULE_NAMES="${PN}(net/wireless:${S})"

pkg_setup() {
	get_version
	if linux_config_src_exists; then
		if linux_chkconfig_builtin "MODULES" ; then
			if linux_chkconfig_module "RT2800PCI" ; then
				warn_module=1
			elif linux_chkconfig_builtin "RT2800PCI" ; then
				die "Your kernel was built with CONFIG_RT2800PCI=y. You need to rebuild it without this."
			fi
		else
			die "Nonmodular kernel detected. This package needs a modular kernel."
		fi
	fi
	linux-mod_pkg_setup
}

src_compile() {
	# ARCH ebuild variable conflicts with ARCH from kernel Makefile.  
	eval unset ARCH
	export LINUX_SRC=$KV_DIR
	default
}

src_install() {
	linux-mod_src_install
	if use pm-utils; then
		insinto /usr/lib/pm-utils/sleep.d
		doins tools/49rtbt
	fi
	dobin tools/rtbt
	insinto /etc/modprobe.d
	doins tools/ralink-bt.conf
}

pkg_postinst() {
	if [[ ${warn_module} -eq 1 ]]; then
		ewarn "You have rt2800pci compiled as module, you should blacklist it."
		ewarn "Add 'blacklist rt2800pci' to /etc/modprobe.d/blacklist.conf."
	fi
}
