# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Hacking Networked Solutions administrative authentication package"
HOMEPAGE="http://www.hacking.co.uk/"
LICENSE="GPL-3"

KEYWORDS="~alpha amd64 arm arm64 hppa ~ia64 m68k ~mips ppc ppc64 ~riscv s390 sparc x86 ~ppc-aix ~x64-cygwin ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~m68k-mint ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
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
