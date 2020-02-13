# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Client tools for Rados Block Device (RBD) including mount.rbd helper script"
HOMEPAGE="https://github.com/MADhacking/rbd-client-tools-noceph"
LICENSE="GPL-3"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/MADhacking/rbd-client-tools-noceph"
	EGIT_BRANCH="master"
else
	SRC_URI="https://github.com/MADhacking/rbd-client-tools-noceph/archive/${PV}.tar.gz -> ${P}.tar.gz"
fi

KEYWORDS=""
IUSE="test"
SLOT="0"

RDEPEND="sys-apps/util-linux
	virtual/udev"

src_install() {
	einstalldocs

	insinto /etc
	doins etc/*
	
	insinto /lib/udev/rules.d
	doins lib/udev/rules.d/*

	exeinto /sbin
	doexe sbin/*
	
	exeinto /usr/bin
	doexe usr/bin/*
}
