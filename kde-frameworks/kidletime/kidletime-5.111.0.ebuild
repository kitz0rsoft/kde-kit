# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_TEST="false"
QT_MINIMAL=5.15.1
inherit kde5

DESCRIPTION="Framework for detection and notification of device idle time"
LICENSE="LGPL-2+"
KEYWORDS="*"
IUSE="wayland X xscreensaver"

REQUIRED_USE="xscreensaver? ( X )"

DEPEND="
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	wayland? (
		>=dev-libs/plasma-wayland-protocols-1.7.0
		>=dev-libs/wayland-protocols-1.27:0
		dev-libs/wayland
		$(add_qt_dep qtgui wayland)
		$(add_qt_dep qtwayland)
	)
	X? (
		$(add_qt_dep qtx11extras)
		x11-libs/libX11
		x11-libs/libxcb
		x11-libs/libXext
	)
	xscreensaver? (
		$(add_qt_dep qtdbus)
		x11-libs/libXScrnSaver
	)
"
RDEPEND="${DEPEND}"

src_prepare() {
	kde5_src_prepare
	if ! use xscreensaver; then
		sed -i -e "s/\${X11_Xscreensaver_FOUND}/0/" CMakeLists.txt || die
	fi
}

src_configure() {
	local mycmakeargs=(
		$(cmake_use_find_package wayland Qt5WaylandClient)
		$(cmake-utils_use_find_package X X11)
		$(cmake-utils_use_find_package X XCB)
	)

	kde5_src_configure
}
