#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/43/x86_64/repoview/index.html&protocol=https&redirect=1

# Enable the zen browser COPR and install
dnf -y copr enable sneexy/zen-browser
dnf install -y sneexy/zen-browser

# Disable the zen browser COPR
# dnf -y copr disable sneexy/zen-browser

# this installs packages from fedora repos
dnf5 install -y kitty \
    gdb \
    gdb-gef \
    minicom \
    libunwind-devel

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

systemctl enable podman.socket
