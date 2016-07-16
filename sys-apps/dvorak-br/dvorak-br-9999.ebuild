# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
inherit git-r3

EGIT_REPO_URI="https://github.com/nandoflorestan/teclado-br.git"
HOMEPAGE="https://github.com/nandoflorestan/teclado-br"

DESCRIPTION="Dvorak brazilian map."
SLOT="0"
LICENSE="public-domain"
KEYWORDS="~amd64 ~x86"
IUSE="X console"
REQUIRED_USE="|| ( X console )"

RDEPEND="
	app-arch/gzip
	console? ( sys-apps/kbd )
	X? ( x11-misc/xkeyboard-config )
"
DEPEND="${RDEPEND}"

src_compile() {
	:;
}

src_install() {
	if use console; then
		mv unix/brdk/brdk.kmap dvorak-br.map
		gzip dvorak-br.map
		insinto /usr/share/keymaps/i386/dvorak
		doins dvorak.map.gz
	fi

	if use X; then
		gzip unix/brdk/brdk
		insinto /usr/share/X11/xkb/symbols
		doins unix/brdk/brdk.gz
	fi
}
