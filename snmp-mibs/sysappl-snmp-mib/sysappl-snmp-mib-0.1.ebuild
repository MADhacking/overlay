# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Definitions of System-Level Managed Objects for Applications - RFC 2287"
HOMEPAGE="https://tools.ietf.org/html/rfc2287"
SRC_URI="https://downloads.mad-hacking.net/software/${P}.tar.bz2"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64 arm x86"
IUSE=""

src_install() {
	insinto /usr/share/snmp/mibs
	doins usr/share/snmp/mibs/*
}
