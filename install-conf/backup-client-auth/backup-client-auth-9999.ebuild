# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Hacking Networked Solutions backup-client authentication configuration package"
HOMEPAGE="http://www.hacking.co.uk/"
LICENSE="GPL-3"

KEYWORDS=""
IUSE=""
SLOT="0"

RDEPEND="acct-user/backup
	app-admin/sudo
	app-shells/bash
	virtual/ssh"
DEPEND=""

S="${WORKDIR}"

src_install() {
	einstalldocs

	# Create and install ~/.ssh/authorized_keys
	insinto /home/backup/.ssh
	newins "${FILESDIR}/authorized_keys_20200121" "authorized_keys"

	# Copy ~/validate-backup-cmd.sh script
	exeinto /home/backup
	newexe "${FILESDIR}/validate-backup-cmd_20200121.sh" "validate-backup-cmd.sh"
}
