# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.8.0"
NODE_MODULE_EXTRA_FILES="src bin data dist"

inherit node-module

DESCRIPTION="Static analysis tool for JavaScript"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DEPEND=">=net-libs/nodejs-${NODEJS_MIN_VERSION}"
DOCS=( README.md )

src_install() {
	node-module_src_install
	install_node_module_binary "bin/jshint" "/usr/bin/jshint" 
}
