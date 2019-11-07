# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Managed Objects for Network Time Protocol Version 4 (NTPv4) - RFC 5907"
HOMEPAGE="https://tools.ietf.org/html/rfc5907"
SRC_URI="https://downloads.mad-hacking.net/software/${P}.tar.bz2"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64 arm x86"
IUSE=""

RDEPEND="snmp-mibs/sysappl-snmp-mib"

src_install() {
	insinto /usr/share/snmp/mibs
	doins usr/share/snmp/mibs/*
}
