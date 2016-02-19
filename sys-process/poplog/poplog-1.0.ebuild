# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

DESCRIPTION="Simple log notification."
HOMEPAGE="http://awesome.naquadah.org/wiki/Dbus,_naughty_and_logs"
SRC_URI=""

LICENSE="CC-BY-3.0"
SLOT=0
KEYWORDS="~amd64 ~x86"
S="${WORKDIR}"

DEPEND="
	x11-wm/awesome
	sys-process/incron
	dev-util/source-highlight
	x11-themes/gnome-icon-theme
	x11-libs/libnotify
"

src_install() {
	dobin ${FILESDIR}/popLog.sh
	insinto /usr/share/awesome/lib/poplog
	doins ${FILESDIR}/awesome.outlang
}

pkg_postinst() {
	elog "You need to create an incron entry like this for each log file you want to monitor:"
	elog "It needs to be in the incrontab for the running user."
	elog ""
	elog "/var/log/kern.log IN_MODIFY sh /usr/bin/popLog.sh /var/log/kern.log"
}
