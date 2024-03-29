# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Hacking Networked Solutions rsync backup-client configuration package"
HOMEPAGE="http://www.hacking.co.uk/"
LICENSE="GPL-3"

KEYWORDS="~alpha amd64 arm arm64 hppa ~ia64 ~loong ~m68k ~mips ppc ppc64 ~riscv ~s390 sparc x86 ~sparc-solaris"
IUSE=""
SLOT="0"

RDEPEND="install-conf/backup-client-auth
	net-misc/rsync"
DEPEND=""

S="${WORKDIR}"

src_install() {
	einstalldocs

	insinto /etc/sudoers.d
	doins "${FILESDIR}/50_rsync_backup_client"
	fperms 0440 "/etc/sudoers.d/50_rsync_backup_client"
}
