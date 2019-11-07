# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A library script to ease the development of SNMPD connectors in Bash"
HOMEPAGE="https://github.com/MADhacking/snmpd-connector-lib"
LICENSE="LGPL-3"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/MADhacking/snmpd-connector-lib"
	EGIT_BRANCH="master"
else
	SRC_URI="https://github.com/MADhacking/snmpd-connector-lib/archive/${PV}.tar.gz -> ${P}.tar.gz"
fi

IUSE="test"
SLOT="0"

RESTRICT="!test? ( test )"

RDEPEND="dev-libs/hacking-bash-lib
	net-analyzer/net-snmp"
DEPEND="test? (
	dev-libs/hacking-bash-lib
	dev-util/bats-assert
)"

src_test() {
	bats --tap tests || die "Tests failed"
}

src_install() {
	einstalldocs

	insinto /usr/lib
	doins usr/lib/*
}
