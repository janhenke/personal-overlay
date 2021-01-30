# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="Cross-platform C++ binding for the OpenGL API"
HOMEPAGE="https://github.com/cginternals/glbinding"
SRC_URI="https://github.com/cginternals/glbinding/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	media-libs/glfw
	media-libs/libglvnd
"
DEPEND="${RDEPEND}"
BDEPEND="
	dev-vcs/git
"

PATCHES=(
	"${FILESDIR}/${P}"-CMakeLists.patch
)

src_configure() {
	local mycmakeargs=(
		-DBUILD_SHARED_LIBS=ON
		-DOPTION_SELF_CONTAINED=OFF
		-DOPTION_BUILD_TESTS=OFF
		-DOPTION_BUILD_DOCS=OFF
		-DOPTION_BUILD_EXAMPLES=OFF
		-DOPTION_BUILD_WITH_BOOST_THREAD=OFF
		-DOPTION_BUILD_CHECK=OFF
		-DOPTION_BUILD_OWN_KHR_HEADERS=OFF
		-DOPTION_BUILD_WITH_LTO=ON
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install

	# already installed by libglvnd
	rm "${D}/usr/include/KHR/khrplatform.h" || die "Deleting KHR header file failed."
}
