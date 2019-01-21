# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit font

DESCRIPTION="Font designed for aircraft coclpit displays"
HOMEPAGE="http://b612-font.com/"
SRC_URI="http://git.polarsys.org/c/b612/b612.git/snapshot/b612-master.zip -> ${P}.zip"

LICENSE="EPL-1.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
IUSE=""

S="${WORKDIR}/b612-master"
FONT_S="${S}/TTF"
FONT_SUFFIX="ttf"

DOCS="README.md"
