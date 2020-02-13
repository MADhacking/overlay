# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Client tools for Rados Block Device (RBD) including mount.rbd helper script"
HOMEPAGE="https://github.com/MADhacking/rbd-client-tools"
LICENSE="GPL-3"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/MADhacking/rbd-client-tools"
	EGIT_BRANCH="master"
else
	SRC_URI="https://github.com/MADhacking/rbd-client-tools/archive/${PV}.tar.gz -> ${P}.tar.gz"
fi

KEYWORDS=""
IUSE="test"
SLOT="0"

RDEPEND="sys-cluster/ceph"

src_install() {
	einstalldocs

	exeinto /sbin
	doexe sbin/*
}
