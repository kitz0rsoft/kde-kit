# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit kde5

DESCRIPTION="Framework for pseudo terminal devices and running child processes"
LICENSE="LGPL-2+"
KEYWORDS="*"
IUSE=""

DEPEND="
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
	sys-libs/libutempter
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DUTEMPTER_EXECUTABLE="${EPREFIX}/usr/sbin/utempter"
	)

	kde5_src_configure
}