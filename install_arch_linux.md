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

### Partioning

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
# sda2: / (20G)
Partition number: 2
First sector: (press Enter)
Last sector: +20G
Hex code or GUID: 8300
```

```
# sda3: /home (All the remaining space)
Partition number: 3
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

```
Partition number: 3
Enter name: /home
```

Show the partition table
```
p

Number  Start (sector)    End (sector)  Size       Code  Name
   1            2048          411647   200.0 MiB   EF00  /boot
   2          411648        31868927   15.0 GiB    8300  /
   3        31868928       234441614   96.6 GiB    8300  /home
```

If everything looks fine, write the changes and quit
```
w
```

### Filesystems

Create filesystems
```
$ mkfs.ext4 /dev/sda2
$ mkfs.ext4 /dev/sda3
$ mkfs.fat -F32 /dev/sda1
```

Mount the filesystems
```
$ mount /dev/sda2 /mnt
$ mkdir /mnt/boot
$ mkdir /mnt/home
$ mount /dev/sda1 /mnt/boot
$ mount /dev/sda3 /mnt/home
```

### System installation

Install the system
```
$ pacstrap /mnt base base-devel
```

Set up fstab
```
$ genfstab -U -p /mnt >> /mnt/etc/fstab
```

### System configuration

Start the system configuration by changing the apparent root directory for the current running process and their children
```
$ arch-chroot /mnt
```

Install `git`, `vim` and `GNU Stow` to get, edit and symlink my dotfiles
```
$ pacman -S git vim stow
```

Clone my dotfiles repository
```
$ git clone git@github.com:dmarcoux/dotfiles.git
```

If needed, select the branch specific to this computer. Otherwise, stay on `master`
```
$ git checkout MY_BRANCH_NAME
```

Use the `/etc` configuration files from my dotfiles
```
$ rm /etc/locale.gen /etc/locale.conf /etc/pacman.conf /etc/systemd/journald.conf
$ stow -t / etc
```

Generate the locales
```
$ locale-gen
```

Set up the hostname
```
$ echo MY_HOST_NAME > /etc/hostname
```

Install the boot loader
```
$ bootctl install
```

Symlink the boot entry from my dotfiles
```
$ mkdir /boot/loader/entries
$ stow -t / boot
```

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

Pull the install medium from the system now

### Post-installation

Log in as `root`

Sync `pacman` databases
```
$ pacman -Syy
```

Install packages from my dotfiles

TODO:
- git checkout master
- Use master for default packages to install
- install aura
- Install AUR packages
