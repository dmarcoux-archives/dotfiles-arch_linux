```
@dmarcoux/dotfiles

My Linux config files
```

###Introduction

I decided to create this repo to backup my dotfiles, but also to share what I use. Sharing my dotfiles is important to me as it is a way to give back to the community. I was inspired by a few repos on GitHub and it helped me tremendously in my quest to fine-tune my setup. I use Linux, more specifically Arch Linux, so be aware that I haven't used my dotfiles on another OS or Linux distribution. I am not responsible for injuries sustained by people using my dotfiles!


###Explanations

I use GNU Stow to manage my dotfiles as it is simple to use and keeps my home directory clean without any git files. To understand how to use GNU Stow, I recommend you to read the link *Using GNU Stow to manage your dotfiles* from the **Credits** section below.

To manage the different setups I have between my computers, I simply use Git. Please have a look at the **Git Workflow** section below for more details.


###Quick Install

Go to your home directory

```cd ~```

Clone the repo

```git clone http://github.com/dmarcoux/dotfiles```

Go to the dotfiles directory

```cd dotfiles```

Select the branch you want to use for this computer (or stay on `master`)

```git checkout the_branch_name```

Install packages from official repositories

```pacman -S $(< pkgs/pkgs.txt)```

Install aura (if you need packages from AUR)

```bash scripts/install_aura.sh```

Install packages from AUR

```aura -A $(< pkgs/aur-pkgs.txt)```

Install *xyz* in $HOME (for example, vim)

```stow vim```

Uninstall *xyz* from $HOME (for example, vim)

```stow -D vim```

Install *abc* in a specific directory (for example, *etc* in the directory `/`)

```sudo stow -t / etc```

Uninstall *abc* from a specific directory (for example, *etc* from the directory `/`)

```sudo stow -D etc -t /```


### Git Workflow

I have the `master` branch which is for what is common between all my computers. I have a branch per computer to manage each computer's specific configuration. They are all based on the `master` branch and whenever I update `master`, I rebase each branch. There might be a tool to handle this type of workflow or something similar, but after some search, I didn't find something which really suits my needs. So, I decided to proceed like this and I am happy with it so far. Here's what I do whenever I update the `master` branch.

Work on the `master` branch

```
git checkout master
git pull --rebase
```

Add and commit my changes to the `master` branch

```git commit -am "My commit's message"```

Push my changes to this repository

```git push origin master```

Rebase my other branches and push the rebased branches to this repository

```
git rebase master laptop_work
git push origin laptop_work --force
```

If needed, go back to the branch of the computer I am currently using

```git checkout laptop_personal```


###Credits

Bits and chunks of my config files come from these sources. Thanks to the people behind them!

- Using GNU Stow to manage your dotfiles

http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html

- zsh and GNU Stow usage

https://github.com/xero/dotfiles

- Solarized theme for vim

https://github.com/altercation/vim-colors-solarized

- Solarized theme for termite

https://github.com/alpha-omega/termite-colors-solarized

- i3blocks (cpu_usage, ethernet and wifi)

https://github.com/vivien/i3blocks

- xrandr_both script

https://github.com/j-san/i3-config/blob/master/configure-xrandr.sh

- install_arch_linux mardown file (I made it myself, but couldn't have done it without these references)

https://wiki.archlinux.org/index.php/Beginners'_guide

http://jorisvandijk.com/2014/installing-arch-on-a-uefi-gpt-system/

- .Xresources

https://www.reddit.com/r/archlinux/comments/40w3ld/why_is_font_rendering_so_crap_by_default/cyxlida
