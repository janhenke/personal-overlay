# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

inherit versionator

DOWNLOAD_URL="https://jdk9.java.net/download/"

ORIG_NAME="jdk-$(get_version_component_range 1)_doc-api-spec.tar.gz"

DESCRIPTION="Oracle's documentation bundle (including API) for Java SE"
HOMEPAGE="https://jdk9.java.net/download/"
SRC_URI="${ORIG_NAME}"
LICENSE="Oracle-EADLA" # will probably change to oracle-java-documentation-9 (or something like it) when released
SLOT="9"
KEYWORDS="~amd64 ~arm ~ppc64 ~x86 ~amd64-linux ~x86-linux"
RESTRICT="fetch"

DEPEND="app-arch/unzip"

S="${WORKDIR}/docs"

pkg_nofetch() {
	einfo "Please download ${ORIG_NAME} from "
	einfo "${DOWNLOAD_URL}"
	einfo "(agree to the license) and place it in ${DISTDIR}"

	einfo "If you find the file on the download page replaced with a higher"
	einfo "version, please report to the bug 67266 (link below)."
	einfo "If emerge fails because of a checksum error it is possible that"
	einfo "the upstream release changed without renaming. Try downloading the file"
	einfo "again (or a newer revision if available). Otherwise report this to"
	einfo "https://bugs.gentoo.org/67266 and we will make a new revision."
}

src_install(){
	docinto html
	dodoc index.html

	local i
	for i in *; do
		[[ -d $i ]] && doins -r $i
	done
}
