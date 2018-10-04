# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit eutils

MYPV="1.17.1b1"

SRC_URI="https://github.com/gorhill/uBlock/releases/download/$MYPV/uBlock0.firefox.signed.xpi"

DESCRIPTION="An efficient blocker for Firefox"
HOMEPAGE="https://github.com/gorhill/uBlock"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"

DEPEND="|| ( www-client/firefox
	www-client/firefox-bin )"

RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_unpack() {
	cp ${DISTDIR}/uBlock0.firefox.signed.xpi ${S}/
}

src_install() {
	dodir /usr/share/firefox-ublock
	insinto /usr/share/firefox-ublock
	doins -r *
}
