# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A collection of scripts to automate backups using rsnapshot"
HOMEPAGE="https://github.com/MADhacking/rsnapshot-scripts"
LICENSE="GPL-3"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/MADhacking/rsnapshot-scripts"
	EGIT_BRANCH="master"
else
	SRC_URI="https://github.com/MADhacking/rsnapshot-scripts/archive/${PV}.tar.gz -> ${P}.tar.gz"
fi

KEYWORDS="alpha amd64 ppc ppc64 sparc x86"
IUSE="test"
SLOT="0"

RESTRICT="!test? ( test )"

RDEPEND="app-backup/rsnapshot"
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

	exeinto /usr/bin
	doexe usr/bin/*

	insinto /etc
	doins -r etc/*
}
