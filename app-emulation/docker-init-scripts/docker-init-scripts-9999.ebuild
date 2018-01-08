# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vcs-snapshot

DESCRIPTION="Docker container init scripts"
HOMEPAGE="https://github.com/janhenke/docker-container-init-script"
SRC_URI="https://github.com/janhenke/${PN}/tarball/master.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="app-emulation/docker"

src_install() {
	newinitd "${S}/"docker-container-init.script docker-container
	newconfd "${S}/"docker-container-conf.example docker-container.conf.example
}
