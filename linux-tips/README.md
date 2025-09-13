* TOC
{:toc}

# Linux Command reference

| Command | Keywords/Description |
| ------- | ---------------------|
| `cat /proc/cmdline` | Commandline options kernel was started with |
| `lsb_release -a` | Distribution version details |
| `uname -a` | Kernel details |
| `sudo dmidecode -s system-serial-number` | Machine serial number |
| `journalctl --system -S "2024-03-22 14:00"` | System log (add `-no-tail` when piping to something) |
| `edid-decode /sys/class/drm/card0-eDP-1/edid` | Get display details |
| `sudo lshw -C memory` | Memory (RAM) details |
| `sudo smartctl -a /dev/nvme0` | NVMe SSD details |
| `lsblk` | Block device e.g. disk details |
| `lscpu` | CPU details |
| `lsusb` | USB bus details |
| `sudo hwinfo` | Firehose of hardware info |
| `df -H` | Disk space stats in human friendly format |
| `sudo systemctl status <service name>` | Service status |
| `sudo systemctl start|stop|enable <service name>` | Enable, start and stop to control services |
| `cat /sys/power/mem_sleep` | Sleep mode details |
| `cat /sys/power/disk` | What the kernel should do after creating a hibernation image |
| `sudo systemctl mask hibernate.target hybrid-sleep.target` | Mask sleep states |
| `sudo systemctl status sleep.target suspend.target hibernate.target hybrid-sleep.target` | Examine masked states |
| `lpstat` | Get printer details |
| `lp` | print files |
| `echo $XDG_CURRENT_DESKTOP` | Current window manager |
| `sudo vi /etc/default/grub` | Edit GRUB configuration |
| `sudo update-grub` | Write out GRUB configuration (Ubuntu) |
| `sudo grub2-mkconfig -o /boot/grub/grub.cfg` | If update-grub is not available |
| `avahi-browse -a` | Find devices via mDNS |
| `avahi-resolve-address 192.168.8.1` | Find mDNS name for given address |
| `getent hosts 192.168.8.1` | |
| `apt show X`| Show details (including size) of a package | 
| `ifconfig` | Networking interface configuration |
| `mtr 8.8.8.8` | Trace route to host |
| `ls -R` | List directory contents recursively |
| `cmd > std.out 2> std.err` | Redirect stdout of `cmd` to `std.out` and stderr to `std.err` |
| `cmd 2> out.txt` | Redirect stdout and stderr to `out.txt` |
| `du -sh <directory>` | Size of directory |
| `df -H` | Used and free sizes of all mount points |
| `find . -type d -empty -print` | Find and print all empty directories |
| `find . -type d -empty -delete`| Delete all empty directories |
| `find Takeout -name "*.json" -type f -print` | Find and print all files with given extension |
| `iperf3 -s` | Start [iperf3]() server on target machine "hostname" |
| `iperf3 -c hostname` | connect to "hostname" and determine speed of connection |
| `xhost + local:user2` | grant "user2" access to your display on the 
(non-network) local machine |
| `su - user2` | open a login shell as "user2" |
| `pdfjam <input file> <page ranges> -o <output file>` | Extract pages from pdf|



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

