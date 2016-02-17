# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

DESCRIPTION="Wrap for extra commands after genkernel execution."
HOMEPAGE="https://github.com/alinefr"
SRC_URI=""

LICENSE="BEER-WARE"
SLOT=0
KEYWORDS="~amd64 ~x86"
S="${WORKDIR}"

DEPEND="
	|| ( sys-kernel/genkernel sys-kernel/genkernel-next )
"

src_install() {
	dobin ${FILESDIR}/genefikernel
}
