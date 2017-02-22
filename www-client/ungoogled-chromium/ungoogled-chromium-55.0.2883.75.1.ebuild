# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit versionator
MY_PV=$(replace_version_separator 3 '-' $(replace_version_separator 4 '-'))
MY_P="${PN}_${MY_PV}_linux_x64_9Morello"
S="${WORKDIR}/${PN}_$(replace_version_separator 4 '-')"

DESCRIPTION="Modifications to Google Chromium for removing Google integration and enhancing privacy, control, and transparency."
HOMEPAGE="https://github.com/Eloston/ungoogled-chromium"
SRC_URI="https://github.com/Eloston/${PN}/releases/download/$(replace_version_separator 4 '-')/${MY_P}.tar.xz"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /opt/${PN}
	doins -r ${S}/*
	fperms +x /opt/${PN}/chrome
	dosym /opt/${PN}/chrome /opt/bin/chrome
	doman ${S}/chrome.1
}
