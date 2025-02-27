# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake xdg-utils

DESCRIPTION="LXQt system configuration control center"
HOMEPAGE="https://lxqt.github.io/"

SRC_URI="https://github.com/lxqt/lxqt-config/releases/download/1.4.0/lxqt-config-1.4.0.tar.xz -> lxqt-config-1.4.0.tar.xz"
KEYWORDS="*"

LICENSE="GPL-2 GPL-2+ GPL-3 LGPL-2 LGPL-2+ LGPL-2.1+ WTFPL-2"
SLOT="0"
IUSE="+monitor +touchpad"

BDEPEND="
	dev-qt/linguist-tools:5
	dev-util/lxqt-build-tools
"
DEPEND="
	>=dev-libs/libqtxdg-3.12.0
	dev-qt/qtcore:5
	dev-qt/qtdbus:5
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
	dev-qt/qtx11extras:5
	dev-qt/qtxml:5
	kde-frameworks/kwindowsystem:5
	=lxqt-base/liblxqt-1.4*
	sys-libs/zlib:=
	x11-apps/setxkbmap
	x11-libs/libxcb:=
	x11-libs/libX11
	x11-libs/libXcursor
	x11-libs/libXfixes
	monitor? ( kde-plasma/libkscreen:5= )
	touchpad? (
		virtual/libudev
		x11-drivers/xf86-input-libinput
		x11-libs/libXext
		x11-libs/libXi
	)
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DWITH_MONITOR=$(usex monitor)
		-DWITH_TOUCHPAD=$(usex touchpad)
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
	doman man/*.1 liblxqt-config-cursor/man/*.1 lxqt-config-appearance/man/*.1
}

pkg_postinst() {
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_icon_cache_update
}

post_src_unpack() {
	if [ ! -d "${S}" ]; then
		mv "${WORKDIR}"/* "${S}" || die
	fi
}