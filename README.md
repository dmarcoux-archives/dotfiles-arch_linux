```
@dmarcoux/dotfiles

My Linux config files
```


#Introduction

I decided to create this repo to backup my dotfiles, but also to share what I use. Sharing my dotfiles is important to me as it is a way to give back to the community. I was inspired by a few repos on GitHub and it helped me tremendously in my quest to fine-tune my setup. I use Linux, more specifically Arch Linux, so be aware that I haven't used my dotfiles on another OS or Linux distribution. I am not responsible for injuries sustained by people using my dotfiles!


#Explanations

I use GNU Stow to manage my dotfiles as it is simple to use and keeps my home directory clean without any git files. To understand how to use GNU Stow, I recommend you to read the link *Using GNU Stow to manage your dotfiles* from the **Credits** section below.


#Quick Install

Go to your home directory

```cd ~```

Clone the repo

```git clone http://github.com/dmarcoux/dotfiles```

Go to the dotfiles directory

```cd dotfiles```

Install aura (if you need packages from AUR) #TODO: Script for this
```
mkdir tmp
cd tmp
wget -O PKGBUILD 'https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=aura-bin'
makepkg
pacman -U aura*.pkg.tar.gz
```

Install packages from official repositories and AUR

```
pacman -S $(< pkgs/personal/pkgs.txt)
aura -A $(< pkgs/personal/aur-pkgs.txt)
```

Install *xyz* in $HOME (for example, vim)

```stow vim```

Uninstall *xyz* from $HOME (for example, vim)

```stow -D vim```

Install *abc* in a specific directory (for example, etc in the directory /)

```sudo stow -t / etc```

Uninstall *abc* from a specific directory (for example, etc in the directory /)

```sudo stow -D etc -t /```

#Credits

Bits and chunks of my config files come from these sources. Thanks to the people behind them!

- Using GNU Stow to manage your dotfiles

http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html

- vim

https://github.com/amix/vimrc

- zsh, vim, GNU Stow usage

https://github.com/xero/dotfiles

- Solarized theme for vim

https://github.com/altercation/vim-colors-solarized

- Solarized theme for termite

https://github.com/alpha-omega/termite-colors-solarized

- i3blocks (cpu_usage, ethernet and wifi)

https://github.com/vivien/i3blocks
