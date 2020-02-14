# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="7"
PYTHON_COMPAT=(python2_7)

declare -A CALCULATE_MODULES=(
	["lib"]="3.6.7.14"
	["install"]="3.6.7.7"
	["core"]="3.6.7.4"
	["i18n"]="3.6.7.7"
	["update"]="3.6.7.7"
	["builder"]="3.6.7.5"
)

inherit calculate-utils-r7

DESCRIPTION="A set of Calculate utilities for system installation, build and upgrade"
HOMEPAGE="http://www.calculate-linux.org/main/en/calculate_utilities"

LICENSE="Apache-2.0"
SLOT="3"
KEYWORDS="amd64"

