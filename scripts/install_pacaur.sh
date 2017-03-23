#!/usr/bin/env bash

# Create temporary directories...
mkdir --parents ~/tmp/install_cower ~/tmp/install_pacaur

# Install cower and its dependencies (as pacaur depends on it)
cd ~/tmp/install_cower
wget --output-document=PKGBUILD 'https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=cower'
makepkg --syncdeps --install --noconfirm

# Install pacaur and its dependencies
cd ~/tmp/install_pacaur
wget --output-document=PKGBUILD 'https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=pacaur'
makepkg --syncdeps --install --noconfirm

# Remove temporary directories
rm --recursive --force ~/tmp/install_cower ~/tmp/install_pacaur
