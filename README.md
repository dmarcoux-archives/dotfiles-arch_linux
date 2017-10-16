# <a href="https://github.com/dmarcoux/dotfiles">dmarcoux/dotfiles</a>

I decided to create this repo to backup my dotfiles, but also to share what I use. Sharing my dotfiles is important to me as it is a way to give back to the community. I was inspired by a few repos on GitHub and it helped me tremendously in my quest to fine-tune my setup. I use Linux, more specifically Arch Linux, so be aware that I haven't used my dotfiles on another OS or Linux distribution.

### Explanations

I use GNU Stow to manage my dotfiles as it is simple to use and keeps my home directory clean without any git files. To understand how to use GNU Stow, I recommend you to read the link *Using GNU Stow to manage your dotfiles* from the **Credits** section below.

### Quick Install

Go to your home directory

`cd`

Clone the repo

`git clone http://github.com/dmarcoux/dotfiles`

Go to the dotfiles directory

`cd dotfiles`

Install AUR helper

`./scripts/install_pacaur.sh`

Install packages from official repositories and AUR

`pacman -S $(< pkgs/{,aur-}pkgs.txt)`

Install *xyz* in $HOME (for example, vim)

`stow vim`

Uninstall *xyz* from $HOME (for example, vim)

`stow -D vim`

Install *abc* in a specific directory (for example, *etc* in the directory `/`)

`sudo stow -t / etc`

Uninstall *abc* from a specific directory (for example, *etc* from the directory `/`)

`sudo stow -D etc -t /`

### Credits

Bits and chunks of my config files come from these sources. Thanks to the people behind them!

- [Using GNU Stow to manage your dotfiles](http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html)
- [zsh](https://github.com/xero/dotfiles) and [GNU Stow usage](https://github.com/xero/dotfiles/issues/6)
- [Solarized theme for termite](https://github.com/alpha-omega/termite-colors-solarized)
- [i3blocks](https://github.com/vivien/i3blocks)
- [xrandr_both script](https://github.com/j-san/i3-config/blob/master/configure-xrandr.sh)
- install_arch_linux.md (I couldn't have done it without these references: [1](https://wiki.archlinux.org/index.php/Beginners'_guide), [2](http://jorisvandijk.com/2014/installing-arch-on-a-uefi-gpt-system/))
- [.Xresources](https://www.reddit.com/r/archlinux/comments/40w3ld/why_is_font_rendering_so_crap_by_default/cyxlida)
