# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A set of tmux options that should be acceptable to everyone"
HOMEPAGE="https://github.com/tmux-plugins/tmux-sensible"
LICENSE="MIT"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/tmux-plugins/tmux-sensible.git"
	EGIT_BRANCH="master"
else
	SRC_URI="https://github.com/tmux-plugins/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	PATCHES=(
		"${FILESDIR}/tmux-invalid-options-3.0.0.patch"
	)
fi

KEYWORDS="~alpha amd64 arm arm64 hppa ~ia64 ~mips ppc ppc64 ~s390 sparc x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos"
IUSE=""
SLOT="0"

RDEPEND="app-misc/tmux"
DEPEND=""

DOCS=( CHANGELOG.md LICENSE.md README.md )

src_install() {
	einstalldocs

	exeinto /usr/lib/"${PN}"
	doexe *.tmux
	
	insinto /etc/tmux.d
	doins "${FILESDIR}/99-tmux-sensible"
}
