# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="KDE administration tools - merge this to pull in all kdeadmin-derived packages"
HOMEPAGE="https://kde.org/"

LICENSE="metapackage"
SLOT="5"
KEYWORDS="*"
IUSE="+cron"

RDEPEND="
	>=kde-apps/ksystemlog-${PV}:${SLOT}
	cron? ( >=kde-apps/kcron-${PV}:${SLOT} )
"
