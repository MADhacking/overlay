# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Hacking Networked Solutions rdiff backup-client configuration package"
HOMEPAGE="http://www.hacking.co.uk/"
LICENSE="GPL-3"

KEYWORDS=""
IUSE=""
SLOT="0"

RDEPEND="app-backup/rdiff-backup
	install-conf/backup-client-auth"
DEPEND=""

S="${WORKDIR}"

src_install() {
	einstalldocs

	insinto /etc/sudoers.d
	doins "${FILESDIR}/50_rdiff_backup_client"
	fperms 0440 "/etc/sudoers.d/50_rdiff_backup_client"
}
