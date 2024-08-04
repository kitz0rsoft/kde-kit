# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="forceoptional"
KDE_TEST="forceoptional"
FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.15.1
inherit kde5

DESCRIPTION="Project management application"
HOMEPAGE="https://calligra.org/plan/"
SRC_URI="mirror://kde/stable/calligra/${PV}/${P}.tar.xz"

LICENSE="GPL-2"
SLOT="5"
KEYWORDS="*"
IUSE="activities +holidays kwallet X"

# FIXME: Disabled by upstream for good reason
# Crashes (https://bugs.kde.org/show_bug.cgi?id=311940)
# $(add_kdeapps_dep akonadi)
# $(add_kdeapps_dep akonadi-contacts)
# Currently upstream-disabled:
# =dev-libs/kproperty-3.0*:5
# =dev-libs/kreport-3.0*:5
DEPEND="
	$(add_qt_dep designer)
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtprintsupport)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtxml)
	$(add_frameworks_dep karchive)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep kglobalaccel)
	$(add_frameworks_dep kguiaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kitemviews)
	$(add_frameworks_dep kjobwidgets)
	$(add_frameworks_dep knotifications)
	$(add_frameworks_dep kparts)
	$(add_frameworks_dep kservice)
	$(add_frameworks_dep ktextwidgets)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kwindowsystem)
	$(add_frameworks_dep kxmlgui)
	dev-lang/perl
	dev-libs/kdiagram:5
	activities? ( $(add_frameworks_dep kactivities) )
	holidays? ( $(add_frameworks_dep kholidays) )
	kwallet? (
		>=app-crypt/qca-2.3.0:2
		$(add_frameworks_dep kwallet)
	)
	X? (
		$(add_qt_dep qtx11extras)
		x11-libs/libX11
	)
"
RDEPEND="${DEPEND}
	!app-office/calligra[calligra_features_plan(-)]
	$(add_qt_dep qtsvg)
"

RESTRICT+=" test"

PATCHES=(
	"${FILESDIR}/${PN}-3.2.2-qt-5.15.patch" # bug 741710
	"${FILESDIR}/${PN}-3.2.2-no-khtml.patch"
)

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package activities KF5Activities)
		$(cmake-utils_use_find_package holidays KF5Holidays)
		$(cmake-utils_use_find_package kwallet Qca-qt5)
		$(cmake-utils_use_find_package kwallet KF5Wallet)
	)
	# Qt5DBus can't be disabled because of KF5DBusAddons dependency

	kde5_src_configure
}
