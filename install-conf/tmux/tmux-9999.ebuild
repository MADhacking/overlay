# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Hacking Networked Solutions tmux configuration"
HOMEPAGE="https://www.hacking.co.uk/"
LICENSE="MIT"

KEYWORDS=""
IUSE=""
SLOT="0"

RDEPEND="
	app-misc/tmux-sensible
	app-misc/tmux-mem-cpu-load
"
DEPEND=""

S="${WORKDIR}"

src_install() {
	einstalldocs

	insinto /etc
	doins "${FILESDIR}/tmux.conf"

	insinto /etc/tmux.d
	doins "${FILESDIR}/80-mem-cpu-load"
	doins "${FILESDIR}/98-local"
}
