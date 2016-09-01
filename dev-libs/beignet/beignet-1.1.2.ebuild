# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python2_7 )
CMAKE_BUILD_TYPE="Release"

inherit python-any-r1 cmake-multilib

DESCRIPTION="OpenCL implementation for Intel GPUs"
HOMEPAGE="http://01.org/beignet"

LICENSE="GPL-2"
SLOT="0"

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="git://anongit.freedesktop.org/beignet"
	KEYWORDS=""
else
	KEYWORDS="~amd64"
	SRC_URI="https://01.org/sites/default/files/${P}-source.tar.gz -> ${P}.tar.gz"
	S=${WORKDIR}/Beignet-${PV}-Source
fi

COMMON="${PYTHON_DEPS}
	media-libs/mesa
	sys-devel/clang
	>=sys-devel/llvm-3.5
	x11-libs/libdrm[video_cards_intel]
	x11-libs/libXext
	x11-libs/libXfixes"
RDEPEND="${COMMON}
	app-eselect/eselect-opencl"
DEPEND="${COMMON}
	virtual/pkgconfig"

PATCHES=(
	"${FILESDIR}"/no-debian-multiarch.patch
	"${FILESDIR}"/no-hardcoded-cflags.patch
	"${FILESDIR}"/do-not-build-tests.patch		# Greatly extends compilation time
	"${FILESDIR}"/llvm-terminfo.patch
	"${FILESDIR}"/llvm-empty-system-libs.patch
)

DOCS=(
	docs/.
)

pkg_pretend() {
	if [[ ${MERGE_TYPE} != "binary" ]]; then
		if [[ $(tc-getCC) == *gcc* ]] ; then
			if [[ $(gcc-major-version) -eq 4 ]] && [[ $(gcc-minor-version) -lt 6 ]]; then
				eerror "Compilation with gcc older than 4.6 is not supported"
				die "Too old gcc found."
			fi
		fi
	fi
}

pkg_setup() {
	python_setup
}

src_prepare() {
	cmake-utils_src_prepare
}

multilib_src_configure() {
	VENDOR_DIR="/usr/$(get_libdir)/OpenCL/vendors/${PN}"

	local mycmakeargs=(
		-DCMAKE_INSTALL_PREFIX="${VENDOR_DIR}"
	)

	cmake-utils_src_configure
}

multilib_src_install() {
	VENDOR_DIR="/usr/$(get_libdir)/OpenCL/vendors/${PN}"

	cmake-utils_src_install

	insinto /etc/OpenCL/vendors/
	echo "${VENDOR_DIR}/lib/${PN}/libcl.so" > "${PN}-${ABI}.icd"
	doins "${PN}-${ABI}.icd"

	dosym "lib/${PN}/libcl.so" "${VENDOR_DIR}"/libOpenCL.so.1
	dosym "lib/${PN}/libcl.so" "${VENDOR_DIR}"/libOpenCL.so
	dosym "lib/${PN}/libcl.so" "${VENDOR_DIR}"/libcl.so.1
	dosym "lib/${PN}/libcl.so" "${VENDOR_DIR}"/libcl.so
}
