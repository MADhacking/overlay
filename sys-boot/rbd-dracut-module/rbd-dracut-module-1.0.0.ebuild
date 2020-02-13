# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Dracut module to boot from Rados Block Device (RBD - Ceph)"
HOMEPAGE="https://github.com/MADhacking/rbd-dracut-module"
LICENSE="GPL-3"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/MADhacking/rbd-dracut-module"
	EGIT_BRANCH="master"
else
	SRC_URI="https://github.com/MADhacking/rbd-dracut-module/archive/${PV}.tar.gz -> ${P}.tar.gz"
fi

KEYWORDS="amd64 ~arm64 ~ppc64"
IUSE="test"
SLOT="0"

RDEPEND="sys-apps/haveged
	sys-cluster/rbd-client-tools
	sys-kernel/dracut
	sys-process/procps"

src_install() {
	einstalldocs

	exeinto /usr/lib/dracut/modules.d/95rbd
	doexe usr/lib/dracut/modules.d/95rbd/*
}
