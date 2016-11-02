#/bin/bash
cd
mkdir tmp
cd tmp
wget -O PKGBUILD 'https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=aura-bin'
makepkg
sudo pacman -U aura*.pkg.tar.xz
