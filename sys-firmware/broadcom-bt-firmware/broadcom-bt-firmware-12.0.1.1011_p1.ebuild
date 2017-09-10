# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit toolchain-funcs

DESCRIPTION="Firmware for BCM20702, BCM20703, BCM43142 chipsets and other Broadcom devices"

HOMEPAGE="https://github.com/winterheart/broadcom-bt-firmware/"
SRC_URI="https://github.com/winterheart/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="Broadcom"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

src_install() {
	insinto /lib/firmware
	doins -r brcm
}
