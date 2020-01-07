# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A collection of wrapper scripts to select the CPU type when using qemu-arm"
HOMEPAGE="https://github.com/MADhacking/qemu-arm-wrappers"
LICENSE="GPL-3"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/MADhacking/qemu-arm-wrappers"
	EGIT_BRANCH="master"
else
	SRC_URI="https://github.com/MADhacking/qemu-arm-wrappers/archive/${PV}.tar.gz -> ${P}.tar.gz"
fi

KEYWORDS="amd64 ~arm64 ~ppc ~ppc64 x86"
IUSE=""
SLOT="0"

RDEPEND=""
DEPEND="app-emulation/qemu[qemu_user_targets_arm,static-user]"

src_prepare() {
	default
	mkdir -p "${S}"/src
	for cpu in $(qemu-arm -cpu help | head -n -1 | tail -n +2); do
		sed "s/replace_this/${cpu}/" "${FILESDIR}"/qemu-wrapper.c > "${S}"/src/qemu-arm-${cpu}.c
	done
}

src_compile() {
	mkdir -p "${S}"/bin
	for cpu in $(qemu-arm -cpu help | head -n -1 | tail -n +2); do
		gcc -static "${S}"/src/qemu-arm-${cpu}.c -O3 -o "${S}"/bin/qemu-arm-${cpu}
	done
}

src_install() {
	dobin "${S}"/bin/*
}
