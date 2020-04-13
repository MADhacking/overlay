# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="Kcov is a code coverage tester for compiled languages, Python and Bash"
HOMEPAGE="https://github.com/SimonKagstrom/kcov"
LICENSE="GPL-2"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/SimonKagstrom/kcov.git"
	EGIT_BRANCH="master"
else
	SRC_URI="https://github.com/SimonKagstrom/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi

KEYWORDS="~alpha amd64 arm arm64 hppa ~ia64 ~m68k ~mips ppc ppc64 s390 sparc x86"
SLOT="0"

RDEPEND="
	dev-libs/elfutils
	net-misc/curl
	sys-devel/binutils:*
	sys-libs/zlib"
DEPEND="${RDEPEND}"
