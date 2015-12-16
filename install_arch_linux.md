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

Create the following partitions (with `n`)

TODO: FINISH!!!
