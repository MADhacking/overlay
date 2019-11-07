# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="SNMP MIB used as a base by all Hacking Networked Solutions SNMP MIBs"
HOMEPAGE="https://www.mad-hacking.net/software/agnostic/hacking-snmp-mib/index.xml"
SRC_URI="https://downloads.mad-hacking.net/software/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm x86"
IUSE=""

src_install() {
	insinto /usr/share/snmp/mibs
	doins usr/share/snmp/mibs/*
}
