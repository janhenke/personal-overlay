# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rpm xdg-utils

DESCRIPTION="VPN client for Fortinet network appliances."
HOMEPAGE="https://www.fortinet.com/support/product-downloads"
SRC_URI="https://repo.fortinet.com/repo/7.0/centos/8/os/x86_64/Packages/forticlient_${PV}_x86_64.rpm"
S="${WORKDIR}"

LICENSE="Fortinet-EULA"
SLOT="0"
KEYWORDS="-* ~amd64"

RESTRICT="mirror"

DEPEND=""
RDEPEND="
	dev-libs/libappindicator
	virtual/libudev
"
BDEPEND="app-arch/rpm"

src_install() {
	insinto ${ROOT}
	doins -r etc lib opt usr

	keepdir var/log/forticlient/fmon_log
	keepdir var/log/forticlient/vcm_log
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}
