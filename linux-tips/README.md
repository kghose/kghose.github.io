---
title: Linux Notes
permalink: /linux-tips
---

* TOC
{:toc}

# Linux Command reference

Commandline options kernel was started with: 
```
cat /proc/cmdline
```  

Distribution version details:
```
lsb_release -a
```

Kernel details:
```
uname -a
```


Machine serial number 
```
sudo dmidecode -s system-serial-number
```

Machine bios version
```
sudo dmidecode -s bios-version 
```


System log (add `-no-tail` when piping to something) 
```
journalctl --system -S "2024-03-22 14:00"
``` 


Get display details 
```
edid-decode /sys/class/drm/card0-eDP-1/edid
```


Memory (RAM) details 
```
sudo lshw -C memory
```


NVMe SSD details 
```
sudo smartctl -a /dev/nvme0
```


Block device e.g. disk details 
```
lsblk
```


CPU details 
```
lscpu
```


USB bus details 
```
lsusb
```


Firehose of hardware info 
```
sudo hwinfo
```


Disk space stats in human friendly format 
```
df -H
```


Service status 
```
sudo systemctl status <service name>
```


Enable, start and stop to control services 
```
sudo systemctl enable <service name>
sudo systemctl start <service name>
sudo systemctl stop <service name>
```


Sleep mode details 
```
cat /sys/power/mem_sleep
```

What the kernel should do after creating a hibernation image 
```
cat /sys/power/disk
```


Mask sleep states
```
sudo systemctl mask \
hibernate.target hybrid-sleep.target
```


Examine masked states 
```
sudo systemctl status \
sleep.target suspend.target hibernate.target hybrid-sleep.target
```

List all available printers
```
lpstat -pa
```

List current jobs
```
lpstat
```

Output will be of the form
```
Brother_HL_L2300-181  kg  165888   Sun 21 Sep 2025 07:48:03 PM EDT
```
Here the `-181` is the job number/

Remove a print job
```
lprm <job number>
```


List jobs that are not completed
```
lpstat -W not-completed
```


Current window manager 
```
echo $XDG_CURRENT_DESKTOP
```


Edit GRUB configuration 
```
sudo vi /etc/default/grub
```


Write out GRUB configuration (Ubuntu) 
```
sudo update-grub
```


If update-grub is not available 
```
sudo grub2-mkconfig -o /boot/grub/grub.cfg
```


Find devices via mDNS 
```
avahi-browse -a
```


Find mDNS name for given address 
```
avahi-resolve-address 192.168.8.1
getent hosts 192.168.8.1
```
 


Show details (including size) of a package 
```
apt show <package name>
```
 

Networking interface configuration 
```
ifconfig
```


Trace route to host 
```
mtr 8.8.8.8
```


```
ls -R
```
 List directory contents recursively 


```
cmd > std.out 2> std.err
```
 Redirect stdout of `cmd` to `std.out` and stderr to `std.err
```


```
cmd 2> out.txt
```
 Redirect stdout and stderr to `out.txt
```


```
du -sh <directory>
```
 Size of directory 


```
df -H
```
 Used and free sizes of all mount points 


```
find . -type d -empty -print
```
 Find and print all empty directories 


```
find . -type d -empty -delete`
 Delete all empty directories 


```
find Takeout -name "*.json" -type f -print
```
 Find and print all files with given extension 


```
iperf3 -s
```
 Start [iperf3]() server on target machine "hostname" 


```
iperf3 -c hostname
```
 connect to "hostname" and determine speed of connection 


```
xhost + local:user2
```
 grant "user2" access to your display on the 
(non-network) local machine 


```
su - user2
```
 open a login shell as "user2" 


```
pdfjam <input file> <page ranges> -o <output file>
```
 Extract pages from pdf



# Make a bootable USB from an iso image

(Use it for booting Linux, updating firmware, anything where a bootable iso
image is supplied)

1. Plug in the USB drive
1. Find which device the drive is labeled as using  `lsblk`. say it's `/dev/sda`
1. Use `dd` to create a bootable USB\
 `dd if=linuxmint-22.1-xfce-64bit.iso of=/dev/sda1 bs=8M status=progress &&
 sync`\
 The `sync` at the end ensures all the data is written to the drive.
 `status=progress` is nice to get an indication nothing's frozen up.  


# mDNS: Local hostname resolution

Multicast DNS ([mDNS]) enables machines to resolve devices on the LAN using
`<hostname>.local` scheme. The implementation for Linux is [Avahi]. Ubuntu
installs this automatically, but some other distributions, like openSUsE, do
not. [The arch wiki page](arch-avahi) is a great
resource for setting it up yourself.  

[mDNS]: https://en.wikipedia.org/wiki/Multicast_DNS 
[Avahi]: https://avahi.org/
[arch-avahi]: https://wiki.archlinux.org/title/avahi

# ControlMaster: persist ssh connections

[ControlMaster] can be used to persist/reuse ssh connections e.g. for rsync

[ControlMaster]: https://man.openbsd.org/ssh_config.5#ControlMaster

Example:

```
# in ~/.ssh/config
ControlMaster auto
ControlPath ~/.ssh/control:%C
ControlPersist 5m
```

# tmux

| `<ctrl>+b` | `c`   | Open a new tab |
|            | 0...9 | Switch to tab |

Add `setw -g mouse on` in `~/.tmux.conf` to enable scrollback with mouse scroll.


# Synology NAS

- Add `https://synocommunity.com/` to Package Sources in Package manager.
- `mosh` is found in it's own package
- `tmux` is found in SynoCLI Network Tools


# Topic sheets

1. [Gnome](gnome.md)
1. [Utilities](utils.md)
1. [Bash multiple history files](bash-history.md)
1. [Multiple Dosbox configurations](dosbox-conf.md)
1. [Writing](writing.md)


# Software I use

## General
```
sudo apt install git flatpak simple-scan
```

## Flatpaks

```
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak install flathub org.mozilla.firefox
flatpak install flathub io.github.dosbox-staging
flatpak install flathub net.sf.VICE
```

### Flatpack commandlines

```
flatpak run --filesystem=/home/kghose/RetroComputing/dosbox io.github.dosbox-staging

flatpak run --filesystem=/home/kghose/RetroComputing/c64/ net.sf.VICE

flatpak run org.mozilla.firefox
```

### Examine permissions

```
flatpak info --show-permissions org.mozilla.firefox
```


# Upgrading firmware (Thinkpads)

[fwup] is the easiest but may not have the most up to date firmware from the
manufacturer. Follow the [basic usage
flow](https://github.com/fwupd/fwupd?tab=readme-ov-file#basic-usage-flow-command-line)
described on the project page.

```
fwupdmgr get-updates
fwupdmgr update
```

[fwup]: https://github.com/fwupd/fwupd

Manufacturers may put out a bootable image. You can use `dd` to create a
bootable USB (steps are noted on this page). 

