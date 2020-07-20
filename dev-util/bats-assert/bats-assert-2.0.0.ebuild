# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A helper library providing common assertions for bats / bats-core"
HOMEPAGE="https://github.com/bats-core/bats-assert"
LICENSE="CC0-1.0"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/bats-core/bats-assert.git"
	EGIT_COMMIT="v2.0.0"
else
	SRC_URI="https://github.com/bats-core/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi

KEYWORDS="~alpha amd64 arm arm64 hppa ~ia64 ~m68k ~mips ppc ppc64 ~riscv s390 sparc x86 ~ppc-aix ~x64-cygwin ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~m68k-mint ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE="test"
SLOT="0"

RESTRICT="!test? ( test )"

RDEPEND="dev-util/bats-support"
DEPEND="test? ( ${RDEPEND} )"

src_test() {
	TEST_DEPS_DIR="/usr/lib" /usr/bin/bats --tap test || die "Tests failed"
}

src_install() {
	einstalldocs

	insinto /usr/lib/"${PN}"
	doins load.bash

	insinto /usr/lib/"${PN}"/src
	doins src/*
}
