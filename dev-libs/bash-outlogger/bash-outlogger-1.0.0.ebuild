# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A library script to log output and manage the generated log files"
HOMEPAGE="https://github.com/MADhacking/bash-outlogger"
LICENSE="LGPL-3"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/MADhacking/bash-outlogger"
	EGIT_BRANCH="master"
else
	SRC_URI="https://github.com/MADhacking/bash-outlogger/archive/${PV}.tar.gz -> ${P}.tar.gz"
fi

KEYWORDS="~alpha amd64 arm hppa ia64 ~mips ppc ppc64 sparc x86"
IUSE="test"
SLOT="0"

RESTRICT="!test? ( test )"

RDEPEND="app-arch/bzip2
	mail-client/mutt
	sys-apps/util-linux"
DEPEND="test? (
	${RDEPEND}
	dev-util/bats-assert
	dev-util/bats-file
)"

src_test() {
	bats --tap tests || die "Tests failed"
}

src_install() {
	einstalldocs

	insinto /usr/lib
	doins usr/lib/*
}
