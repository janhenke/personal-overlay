# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

DESCRIPTION="Guideline Support Library implementation by Microsoft."
HOMEPAGE="https://github.com/Microsoft/GSL"
SRC_URI="https://github.com/Microsoft/GSL/archive/master.zip -> ${PV}.zip"

LICENSE="MIT"

SLOT="0"

KEYWORDS="~amd64 ~x86"

IUSE="test"

DEPEND=" test? ( >=dev-cpp/catch-1.11.0 )"

# header only library
RDEPEND=""

src_configure() {
	:
}

src_compile() {
	:
}

src_install() {
	insinto /usr/include
	doins -r include/gsl
}
