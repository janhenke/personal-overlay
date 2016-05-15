# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit toolchain-funcs

DESCRIPTION="Enumerates all possible OpenCL platform and device properties"

HOMEPAGE="https://github.com/Oblomov/clinfo/"
SRC_URI="https://github.com/Oblomov/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="virtual/opencl"
RDEPEND="${DEPEND}"

src_compile() {
	tc-export CC LD
	default_src_compile
}

src_install() {
	dobin clinfo
	doman man/clinfo.1
}
