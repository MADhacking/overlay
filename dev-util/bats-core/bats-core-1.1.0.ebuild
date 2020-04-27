# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="An automated testing system for bash"
HOMEPAGE="https://github.com/bats-core/bats-core"
LICENSE="MIT"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/bats-core/bats-core.git"
	EGIT_BRANCH="master"
else
	SRC_URI="https://github.com/bats-core/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi

KEYWORDS="~alpha amd64 arm arm64 hppa ~ia64 ~m68k ~mips ppc ppc64 ~riscv s390 sparc x86 ~ppc-aix ~x64-cygwin ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~m68k-mint ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE="test"
SLOT="0"

RESTRICT="!test? ( test )"

RDEPEND="app-shells/bash:0"
DEPEND="test? ( ${RDEPEND} )"

src_test() {
	bin/bats --tap test || die "Tests failed"
}

src_install() {
	einstalldocs

	dobin bin/bats

	insinto /usr/libexec/bats-core
	doins libexec/bats-core/*
	fperms 0755 /usr/libexec/bats-core/bats
	fperms 0755 /usr/libexec/bats-core/bats-exec-suite
	fperms 0755 /usr/libexec/bats-core/bats-exec-test
	fperms 0755 /usr/libexec/bats-core/bats-format-tap-stream
	fperms 0755 /usr/libexec/bats-core/bats-preprocess

	doman man/bats.1 man/bats.7
}
