# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
PYTHON_COMPAT=(python2_7)

inherit calculate-utils

DESCRIPTION="A set of Calculate utilities for system installation, build and upgrade"
HOMEPAGE="http://www.calculate-linux.org/main/en/calculate_utilities"

LICENSE="Apache-2.0"
SLOT="3"
KEYWORDS=""

src_unpack() {
	for MODULE in "${MODULE_INFO[@]}"
	do
		MODULE_DATA=( $MODULE )
		MODULE_PN=${MODULE_DATA[0]}
		EGIT_SOURCEDIR=${WORKDIR}/${MODULE_PN}-${PV} EGIT_REPO_URI=git://git.calculate.ru/calculate-3/${MODULE_PN}.git git-2_src_unpack
	done
}

