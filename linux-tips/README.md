---
title: Linux Notes
permalink: linux-tips/
last_modified_at: 2025-11-01
---

[Buffers, splits and tabs in Vi](vi-buffers) \
[Bash creature comforts](bash) \
[GNOME](gnome) \
[Notes on window managers (Desktops)](desktops) \
[Bug reports](bug-reports)

* TOC
{:toc}

# System

Commandline options kernel was started with
```
cat /proc/cmdline
```  

Distribution version details
```
lsb_release -a
```


Kernel details
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


Process, CPU and memory information: `htop`

GPU information: `intel_gpu_top`

or: `nvtop` (https://github.com/Syllo/nvtop)

For Intel GPUs `setcap` may be needed to set enable `CAP_PERFMON` capabilities
on the binary.

```
sudo setcap cap_perfmon+ep intel_gpu_top
```

# Services

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

# Get laptop display type

Look through `/sys/class/drm/` for the devices. Find which one's `/enabled`
value is "enabled" and then run
```
cat /sys/class/drm/card1-eDP-1/edid | edid-decode 
```


# Sleep states

```
cat /sys/power/state
cat /sys/power/mem_sleep
```

Detailed description of the values are in the [kernel docs](https://www.kernel.org/doc/Documentation/power/states.txt)

Change with

```
echo s2idle | sudo tee /sys/power/mem_sleep deep
```

Also see [these kernel docs](https://www.kernel.org/doc/Documentation/power/interface.txt)


# Printing

List all available printers
```
lpstat -pa
```

List current printer jobs
```
lpstat
```

Output will be of the form
```
Brother_HL_L2300-181  kg  165888   Sun 21 Sep 2025 07:48:03 PM EDT
```
Here the `-181` is the job number.

Remove a print job
```
lprm <job number>
```


List jobs that are not completed
```
lpstat -W not-completed
```

Restart print service (sometimes needed to reconnect to a printer)
```
sudo systemctl restart cups
```

# Filesystem

Size of directory 
```
du -sh <directory>
```

Used and free sizes of all mount points 
```
df -H
```

List directory contents recursively
```
ls -R
```

Find and print all empty directories 
```
find . -type d -empty -print
```


Delete all empty directories 
```
find . -type d -empty -delete`
```

Find and print all files with given extension 
```
find Takeout -name "*.json" -type f -print
```

# Audio

Spot check microphone: You'll get a cool bar in your terminal that shows sound
level.
```
arecord -vv -f dat /dev/null
```

Record 5 seconds of audio at 44 kHz and 16 bit resolution, then play it back.
```
arecord -d 5 -r 44000 -f S16_LE test.wav
aplay test.wav
```


# Bash


Redirect stdout of `cmd` to `std.out` and stderr to `std.err
```
cmd > std.out 2> std.err
```

Redirect stdout and stderr to `out.txt
```
cmd 2> out.txt
```


# Networking

Networking interface configuration 
```
ifconfig
```


Trace route to host 
```
mtr 8.8.8.8
```


# Measure bandwidth

Use [iPerf3](iperf.fr).

Start iperf3 server on target machine "hostname" 
```
iperf3 -s
```


Connect to "hostname" and determine speed of connection 
```
iperf3 -c hostname
```





# Login as different user on a machine and share screen.

Grant "user2" access to your display on the (non-network) local machine 
```
xhost + local:user2
```

Open a login shell as "user2" 
```
su - user2
```

# PDFs 

Use [pdfjam](https://github.com/pdfjam/pdfjam) for joining files together,
selecting pages, reducing several source pages onto one output page, etc.,

It is a user-friendly layer over the powerful
[pdfpages](https://ctan.org/pkg/pdfpages?lang=en) package. 

```
pdfjam <input file> <page ranges> -o <output file>
```

It's annoying to download the whole tex distribution when all we want to do is
convert markdown to a simple pdf using pandoc. We can use the `pdfroff` package.

```
pandoc                               \
   *.md                              \
  -f markdown                        \
  --metadata title="My manuscript"   \
  -o ms.pdf                          \
  --pdf-engine=pdfroff
```

# Images

Use ImageMagick


# Make a bootable USB from an iso image

(Use it for booting Linux, updating firmware, anything where a bootable iso
image is supplied)

1. Plug in the USB drive
1. Find which device the drive is labeled as using  `lsblk`. say it's `/dev/sdx`
1. Use `dd` to create a bootable USB\

```
dd if=linuxmint-22.1-xfce-64bit.iso of=/dev/sdax bs=8M status=progress &&
 sync
```

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

Find devices via mDNS

```
avahi-browse -a
```

Find mDNS name for given address

```
avahi-resolve-address 192.168.8.1
getent hosts 192.168.8.1
```


# ControlMaster: persist ssh connections

[ControlMaster] can be used to persist/reuse ssh connections e.g. for rsync

[ControlMaster]: https://man.openbsd.org/ssh_config.5#ControlMaster

Example: add to `~/.ssh/config` 

```
ControlMaster auto
ControlPath ~/.ssh/control:%C
ControlPersist 5m
```

# Neovim/Vim

Open file for editing in current window `:edit file.txt`

Switch to buffer (with autocomplete) `:b <tab>`

Split pane `:vsplit` or `:hsplit`

Go to pane `CTRL + W` followed by arrow keys. On NeoVim you can also click on
the split.

Go to end of file: `G`

Go to 34% of the file: `34%` 

Copy large number of lines. 
1. Mark starting line `ma`
1. At last line, yank from mark ``y`a``
1. This can be used to delete too ``d`a``


Open file in new tab `:tabedit <filename>` 

Go to second tab `2gt`. On NeoVim you can also click on the tab. 

Wrap paragraph `gq}` 

Check if compiled with clipboard support `:echo has('clipboard')`

For Vim you can do `vim --version | grep clipboard` but not for NeoVim.

Paste from clipboards (When compiled with +clipboard option
```
"+p
"*p
```

Builtin file explorer: `netrw`

Refs: [[1](https://www.vim.org/scripts/script.php?script_id=1075)], 
[[2](https://neovim.io/doc/user/pi_netrw.html)]


## Plugins
1. Git: [git gutter](https://github.com/airblade/vim-gitgutter)
2. LSP plugin: [A.L.E](https://github.com/dense-analysis/ale)


## Configuration notes

In `.vimrc`/`init.vim`

```
" Auto save for markdown files in insert mode
" https://stackoverflow.com/a/60095826
" https://stackoverflow.com/a/63589188

autocmd BufNewFile,BufRead *.md :autocmd TextChangedI <buffer> if &readonly == 0 | silent write | endif



" _Esc_ ape from insert mode is slow
" https://vi.stackexchange.com/a/20220

set tttimeoutlen=5
```


# tmux

Open a new tab
```
<ctrl>+b c
```

Switch to a tab
```
<ctrl>+b 0...9
```

Add `setw -g mouse on` in `~/.tmux.conf` to enable scrollback with mouse scroll.


# Synology NAS

- Add `https://synocommunity.com/` to Package Sources in Package manager.
- `mosh` is found in it's own package
- `tmux` is found in SynoCLI Network Tools


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

# dnf: Fedora (Red Hat) package manager

List all the repositories dnf searches through
```
dnf repolist --enabled
```

Remove a repository (has to be done "manually")
```
rm /etc/yum.repos.d/file_name.repo
```

# Some GNOME settings

Prevent Bluetooth being turned on automatically after wakeups or reboots:

In `/etc/bluetooth/main.conf` set `AutoEnable=false`

# Personal list of software

1. NeoVim
1. pandoc
1. pdfroff
1. firefox
1. pdfjam
1. Image Magick
1. simple scan
1. `intel_gpu_top` / nvtop
1. stylua

