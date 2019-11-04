# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A library providing common helper functions to for bats"
HOMEPAGE="https://github.com/ztombol/bats-support"
SRC_URI="https://github.com/ztombol/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="amd64 x86"

IUSE="test"

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
