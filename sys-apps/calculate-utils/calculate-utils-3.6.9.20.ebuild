# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="7"
PYTHON_COMPAT=(python2_7)

declare -A CALCULATE_MODULES=(
	["lib"]="3.6.9.7"
	["install"]="3.6.9.13"
	["client"]="3.6.9.10"
	["desktop"]="3.6.9.3"
	["update"]="3.6.9.3"
	["builder"]="3.6.9.1"
)

inherit calculate-utils-r12

DESCRIPTION="A set of Calculate utilities for system installation, build and upgrade"
HOMEPAGE="http://www.calculate-linux.org/main/en/calculate_utilities"

LICENSE="Apache-2.0"
SLOT="3"
KEYWORDS="amd64"

