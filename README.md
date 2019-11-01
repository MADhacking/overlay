# MAD Hacking Gentoo Overlay
[![Overlay QA](https://github.com/MADhacking/overlay/workflows/Overlay%20QA/badge.svg)](https://github.com/MADhacking/overlay/actions?workflow=Overlay+QA)

[Gentoo Linux](https://www.gentoo.org/get-started/about/) overlay containing additional ebuild files.

## Installation

### Manually

The repo comes with a ready [repos.conf](https://wiki.gentoo.org/wiki//etc/portage/repos.conf) file you just need to add
to your `/etc/portage/repos.conf/` dir:

    curl -sL https://raw.githubusercontent.com/MADhacking/overlay/master/repos.conf > /etc/portage/repos.conf/mad-hacking.conf
    emerge --sync

### Using layman

    layman -o https://raw.githubusercontent.com/MADhacking/overlay/master/overlay.xml -f -a mad-hacking
