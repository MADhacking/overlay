# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A library providing common helper functions to for bats"
HOMEPAGE="https://github.com/ztombol/bats-support"
LICENSE="CC0-1.0"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/ztombol/bats-support.git"
	EGIT_BRANCH="master"
else
	SRC_URI="https://github.com/ztombol/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi

KEYWORDS="~alpha amd64 arm arm64 hppa ~ia64 ~m68k ~mips ppc ppc64 ~riscv s390 sparc x86 ~ppc-aix ~x64-cygwin ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~m68k-mint ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE="test"
SLOT="0"

RESTRICT="!test? ( test )"

RDEPEND="|| ( dev-util/bats-core dev-util/bats )"
DEPEND="test? ( ${RDEPEND} )"

src_test() {
	/usr/bin/bats --tap test || die "Tests failed"
}

src_install() {
	einstalldocs

	insinto /usr/lib/"${PN}"
	doins load.bash

	insinto /usr/lib/"${PN}"/src
	doins src/*
}
