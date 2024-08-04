# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_TEST="forceoptional"
KMNAME="kdev-python"
PYTHON_COMPAT=( python3+ )
FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.15.1
inherit kde5 python-single-r1

DESCRIPTION="Python plugin for KDevelop"
HOMEPAGE="https://www.kdevelop.org/"

LICENSE="GPL-2" # TODO: CHECK
SLOT="5"
KEYWORDS="*"
IUSE=""

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="${PYTHON_DEPS}
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	dev-util/kdevelop:5=
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kitemmodels)
	$(add_frameworks_dep knewstuff)
	$(add_frameworks_dep kparts)
	$(add_frameworks_dep ktexteditor)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kxmlgui)
	$(add_frameworks_dep threadweaver)
"
RDEPEND="${DEPEND}
	$(python_gen_cond_dep '
		dev-python/pycodestyle[${PYTHON_USEDEP}]
	')
"

RESTRICT+=" test"

pkg_setup() {
	python-single-r1_pkg_setup
	kde5_pkg_setup
}
