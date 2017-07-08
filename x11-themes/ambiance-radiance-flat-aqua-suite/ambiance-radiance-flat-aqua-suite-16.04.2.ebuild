# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils

DESCRIPTION="Ambiance & Radiance Flat Aqua Suite for Unity, Gnome Classic, MATE, XFCE, LXDE and Openbox desktops"
HOMEPAGE="http://www.ravefinity.com/p/download-ambiance-radiance-flat-colors.html"
SRC_URI="http://www.mediafire.com/file/axsjc1f6402ch5x/Ambiance&Radiance-Flat-Colors-16-04-2-LTS-GTK-3-18Theme.tar.gz"

LICENSE="LGPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gtk3"

RESTRICT="fetch mirror strip"
DEPEND="x11-themes/gtk-engines-murrine
	gtk3? ( x11-themes/gtk-engines-unico )
	!=x11-themes/ambiance-radiance-flat-colors-suite-${PV}"
RDEPEND="${DEPEND}"

S="${WORKDIR}/"

pkg_nofetch(){
	einfo "To install this package, please, download the source file from:"
	einfo "https://drive.google.com/file/d/0B7iDWdwgu9QAdlRpNEoyNlY0Nlk/"
	einfo "or:"
	einfo "http://www.mediafire.com/file/axsjc1f6402ch5x/Ambiance&Radiance-Flat-Colors-16-04-2-LTS-GTK-3-18Theme.tar.gz"
	einfo "then, rename it \"Ambiance&Radiance-Flat-Colors-16-04-2-LTS-GTK-3-18Theme.tar.gz\""
	einfo "and place it in ${DISTDIR}"
}

src_install(){
	insinto /usr/share/themes
	doins -r Ambiance*Aqua* Radiance*Aqua*
	use gtk3 || {
		rm -R "${D}"/usr/share/themes/*/gtk-3.0 || die
	}
}
