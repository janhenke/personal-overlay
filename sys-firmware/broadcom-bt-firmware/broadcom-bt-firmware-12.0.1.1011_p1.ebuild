# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit toolchain-funcs

DESCRIPTION="Firmware files for Broadcom Bluetooth devices"

HOMEPAGE="https://github.com/winterheart/broadcom-bt-firmware/"
SRC_URI="https://github.com/winterheart/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="Broadcomm"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

src_install() {
	insinto /lib/firmware
	doins -r brcm
}
