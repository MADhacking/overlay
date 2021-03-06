# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A collection of scripts to assist in the running of a \"build-server\""
HOMEPAGE="https://github.com/MADhacking/buildserver-scripts"
LICENSE="GPL-3"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/MADhacking/buildserver-scripts"
	EGIT_BRANCH="master"
else
	SRC_URI="https://github.com/MADhacking/buildserver-scripts/archive/${PV}.tar.gz -> ${P}.tar.gz"
fi

KEYWORDS=""
IUSE="test"
SLOT="0"

RESTRICT="!test? ( test )"

RDEPEND=">=dev-libs/bash-outlogger-1.0.0"
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
	doexe bin/*

	insinto /etc
	doins etc/*
}
