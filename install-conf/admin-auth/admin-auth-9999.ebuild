# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Hacking Networked Solutions administrative authentication package"
HOMEPAGE="http://www.hacking.co.uk/"
LICENSE="GPL-3"

KEYWORDS=""
IUSE=""
SLOT="0"

RDEPEND="virtual/ssh"
DEPEND=""

S="${WORKDIR}"

src_install() {
	einstalldocs

	# Create and install /root/.ssh/authorized_keys
	insinto /root/.ssh
	newins "${FILESDIR}/authorized_keys_20200121" "authorized_keys"
}
