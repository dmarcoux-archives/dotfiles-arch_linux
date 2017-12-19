### Preparation

For UEFI motherboard, verify if we booted in UEFI mode
```
$ ls /sys/firmware/efi/efivars
```

Wired connection should be working automatically, but verify if it really is
```shell
$ ping -c 3 www.google.com
$ dhcpcd # if it failed
```

### Partitioning

List the storage devices
```
$ lsblk

NAME            MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
sda               8:0    0    80G  0 disk
└─sda1            8:1    0    80G  0 part
```

Use gdisk
```
$ gdisk /dev/sda
```

Create a new partition table and destroy everything on the disk
```
o
```

Create the following partitions (with `n`), then enter the following values for each partition
```
# sda1: /boot (1024M)
Partition number: 1
First sector: (press Enter)
Last sector: +1024M
Hex code or GUID: EF00
```

```
# sda2: /
Partition number: 2
First sector: (press Enter)
Last sector: (press Enter)
Hex code or GUID: 8300
```

Rename each partition (with `c`)
```
Partition number: 1
Enter name: /boot
```

```
Partition number: 2
Enter name: /
```

Show the partition table
```
p

Number  Start (sector)    End (sector)  Size       Code  Name
   1            2048         2099199   1024.0 MiB  EF00  /boot
   2          2099199      234441614   110.8 GiB   8300  /
```

If everything looks fine, write the changes and quit
```
w
```

### Filesystems

Create the filesystems
```
$ mkfs.fat -F32 /dev/sda1
$ mkfs.btrfs /dev/sda2
```

Mount the filesystems (look [here](https://btrfs.wiki.kernel.org/index.php/Mount_options) for details on mount options)
```
$ mount -o defaults,relatime,discard,ssd,space_cache,autodefrag,compress=lzo /dev/sda2 /mnt
$ mkdir /mnt/boot
$ mount /dev/sda1 /mnt/boot
```

### System installation

Install the system with `btrfs support`, `Intel CPUs microcode` and `linux-lts` kernel
```
$ pacstrap -i /mnt base base-devel btrfs-progs intel-ucode linux-lts linux-lts-headers --ignore linux
```

Set up fstab
```
$ genfstab -U -p /mnt >> /mnt/etc/fstab
$ cat /mnt/etc/fstab # To check if the btrfs filesystem is properly configured
```

### System configuration

Start the system configuration by changing the apparent root directory for the current running process and their children
```
$ arch-chroot /mnt
```

Set up the hostname
```
$ echo MY_HOST_NAME > /etc/hostname
```

Install the boot loader
```
$ bootctl install
```

[Create the boot entry](https://github.com/dmarcoux/dotfiles/tree/master/boot/boot/loader/entries/arch-lts.conf)

[Select the default boot entry](https://github.com/dmarcoux/dotfiles/blob/master/boot/boot/loader/loader.conf)

Make sure we have a network connection after we reboot
```
$ systemctl enable dhcpcd.service
```

Set root password
```
$ passwd
```

Create a user
```
$ useradd -m -g users -G wheel -s /bin/bash dany
```

Create a password for the user
```
$ passwd dany
```

Add user to the sudoers group
```
$ echo 'dany ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
```

Exit out of the chroot, unmount and reboot
```
$ exit
$ umount -R /mnt
$ reboot
```

Pull the installation medium from the system now

### Post-installation

Sync `pacman` databases
```
$ pacman -Syy
```

Install `git`, `gvim` and `GNU Stow` to get, edit and symlink my dotfiles (`gvim` is needed to have the system's clipboard functional on Arch Linux)
```
$ pacman -S git gvim stow
```

Clone my dotfiles repository using HTTP for now since my SSH key isn't set on GitHub yet, then go into the directory
```
$ git clone http://github.com/dmarcoux/dotfiles.git
$ cd dotfiles
```

If needed, select the branch specific to this computer. Otherwise, stay on `master`
```
$ git checkout MY_BRANCH_NAME
```

Symlink all the dotfiles I need with `GNU Stow`
```shell
# Do this first!!!
$ rm /etc/locale.gen /etc/pacman.conf /etc/systemd/journald.conf /etc/makepkg.conf
$ stow -t / etc

# Then all the rest
$ stow vim # An example...
```

Generate the locales
```
$ locale-gen
```

Sync `pacman` databases again to get `multilib`
```
$ pacman -Syy
```

Install packages from official repositories (with force otherwise file conflicts arise with files I stow'ed earlier)
```
$ pacman --force --noconfirm -S $(< pkgs/pkgs.txt)
```

Reset my dotfiles to their original state (since some files might have been overwritten by `pacman --force`)
```
$ git checkout etc/
```

Install AUR helper (if I need packages from AUR)
```
$ scripts/install_pacaur.sh
```

Install packages from AUR
```
$ pacaur -y $(< pkgs/aur-pkgs.txt)
```

[Add SSH key to GitHub](https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/)

Switch my dotfiles' git remote from HTTP to SSH
```
$ git remote set-url origin git@github.com:dmarcoux/dotfiles.git
```

TODO: Run restore_backup.sh (decide when to do this)
