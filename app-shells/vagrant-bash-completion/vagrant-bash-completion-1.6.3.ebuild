# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit bash-completion-r1

if [[ ${PV} == 9999* ]]; then
	EGIT_REPO_URI="git://github.com/kura/${PN}.git"
	inherit git-r3
else
	SRC_URI="https://github.com/kura/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
fi

DESCRIPTION="Bash completion for vagrant"
HOMEPAGE="https://github.com/kura/vagrant-bash-completion"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	app-emulation/vagrant-bin 
	!app-emulation/vagrant 
	!<app-shells/bash-4
"
RDEPEND="${DEPEND}
	>=app-shells/bash-completion-2.3-r1
"

src_compile() {
	:;
}

src_install() {
	newbashcomp ${S}/etc/bash_completion.d/vagrant vagrant
}
