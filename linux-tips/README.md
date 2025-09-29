---
title: Linux Notes
permalink: linux-tips/
last_modified_at: 2025-09-28
---

[Linux command reference](linux-command-reference)\
[Bash creature comforts](bash)\
[GNOME](gnome)\
[Neovim etc.](neovim)

* TOC
{:toc}




Measuring bandwidth with [iPerf3](iperf.fr).

Start iperf3 server on target machine "hostname" 
```
iperf3 -s
```


Connect to "hostname" and determine speed of connection 
```
iperf3 -c hostname
```


Login as different user on a machine and share screen.

Grant "user2" access to your display on the (non-network) local machine 
```
xhost + local:user2
```

Open a login shell as "user2" 
```
su - user2
```


Use pdfjam to extract pages from pdf. [Pdfjam](https://github.com/pdfjam/pdfjam) is a user-friendly layer over the powerful [pdfpages](https://ctan.org/pkg/pdfpages?lang=en) package.
```
pdfjam <input file> <page ranges> -o <output file>
```


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

# Ubuntu: Stop apt from installing snaps

From [ask Ubuntu](
https://askubuntu.com/questions/1345385/how-can-i-stop-apt-from-installing-snap-packages)

```
sudo apt-get autopurge snapd
sudo apt-mark hold snapd
```

# Ubuntu: Install Firefox through apt

Follow the instructions on the [Firefox
page](https://support.mozilla.org/en-US/kb/install-firefox-linux#w_install-firefox-deb-package-for-debian-based-distributions-recommended)




