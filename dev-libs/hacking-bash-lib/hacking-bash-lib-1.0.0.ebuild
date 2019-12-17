# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Hacking Networked Solutions library for Bash"
HOMEPAGE="https://github.com/MADhacking/hacking-bash-lib"
LICENSE="LGPL-3"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/MADhacking/hacking-bash-lib"
	EGIT_BRANCH="master"
else
	SRC_URI="https://github.com/MADhacking/hacking-bash-lib/archive/${PV}.tar.gz -> ${P}.tar.gz"
fi

KEYWORDS="alpha amd64 arm arm64 hppa ia64 m68k ~mips ppc ppc64 ~riscv s390 sh sparc x86 ~amd64-linux ~x86-linux"
IUSE="test"
SLOT="0"

RESTRICT="!test? ( test )"

RDEPEND="sys-apps/util-linux"
DEPEND="test? ( dev-util/bats-assert )"

src_test() {
	bats --tap tests || die "Tests failed"
}

src_install() {
	einstalldocs

	insinto /usr/lib
	doins usr/lib/*
}
