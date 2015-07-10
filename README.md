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

Install *xyz* (vim for example)
```stow vim```

Uninstall *xyz* (vim for example)
```stow -D vim```


#Credits

Bits and chunks of my config files come from these sources. Thanks to the people behind them!

- Using GNU Stow to manage your dotfiles
brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html

- vim
https://github.com/amix/vimrc

- zsh, vim
https://github.com/xero/dotfiles

- Solarized theme for vim
https://github.com/altercation/vim-colors-solarized

- Solarized theme for termite
https://github.com/alpha-omega/termite-colors-solarized
