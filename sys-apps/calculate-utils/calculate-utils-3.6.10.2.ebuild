# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="7"
PYTHON_COMPAT=(python2_7)

declare -A CALCULATE_MODULES=(
	["core"]="3.6.10.3"
	["i18n"]="3.6.10.1"
	["console"]="3.6.10.1"
	["builder"]="3.6.10.1"
)

inherit calculate-utils-r14

DESCRIPTION="A set of Calculate utilities for system installation, build and upgrade"
HOMEPAGE="http://www.calculate-linux.org/main/en/calculate_utilities"

LICENSE="Apache-2.0"
SLOT="3"
KEYWORDS=""
