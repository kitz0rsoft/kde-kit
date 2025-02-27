# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="forceoptional" # not optional until !kdelibs4support
FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.15.2
inherit kde5

DESCRIPTION="KDE Plasma workspace hotkey module"
LICENSE="GPL-2" # TODO: CHECK
SLOT="5"
KEYWORDS="*"
IUSE=""

COMMON_DEPEND="
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtx11extras)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep kdelibs4support)[X]
	$(add_frameworks_dep kglobalaccel)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kservice)
	$(add_frameworks_dep ktextwidgets)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kwindowsystem)
	$(add_frameworks_dep kxmlgui)
	$(add_plasma_dep libkworkspace)
	x11-libs/libX11
	x11-libs/libXtst
"
DEPEND="${COMMON_DEPEND}
	x11-base/xorg-proto
	x11-libs/libxcb
	x11-libs/libXtst
"
RDEPEND="${COMMON_DEPEND}
	$(add_frameworks_dep kded)
	$(add_plasma_dep kde-cli-tools)
"