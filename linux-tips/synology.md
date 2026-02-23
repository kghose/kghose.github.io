---
title: Synology
permalink: linux-tips/synology
last_modified_at: 2025-11-22
---

I have a home server to backup and show our photos. I like the Synology devices
(appliances, perhaps) for this purpose because they are 
1. Easy to setup
1. Reasonably hands off
1. Low power (The ones I chose)
1. Run Linux (underneath)
1. Have the apps I need

The Synology Photos application is adequate for backing up photos from our
iPhones.

The Jellyfin server and front ends (for iPad) are spectacular and the Jellyfin
server has a distribution for Synology.

Synology can also run Docker, though I have not tried that yet.

# Mount shared folders "traditionally" (2026)

I've always used shared Synology folders via Nautilus' interface which hides all
the machinery operating underneath, which is [Samba](https://www.samba.org/)
which is an open source
[SMB](https://en.wikipedia.org/wiki/Server_Message_Block) implementation.

This works absolutely fine when on the graphical desktop and using Nautilus for
file management, but very cumbersome when trying to access these mounts on the
command line.

[NFS](https://en.wikipedia.org/wiki/Network_File_System) is the native Linux way
of sharing directories over a network.

## On Synology (As of DSM 7)

1. Enable NFS in system settings
1. Add an NFS rule to the shared folder you want
1. Hostname or IP is the allowlist. I'm within a small in home network and I
   just do "*". If you are open to the wider world, you need to have more
   restrictive allowlisting
1. "Squash" is important. I set it to "Map all users to admin" otherwise I can't
   get things to mount. I don't know if this is too broad, but it only applies
   to this directory tree.
1. If you have firewall enabled on the Synology you'll have to allowlist the NFS
   server.

## On the client Linux machine

1. Create a directory to mount to. I create it under `/mnt` e.g. `/mnt/my_share`
1. Use `mount` to mount the network drive

```
sudo mount -t nfs myserver.local:/my/shared/folder /mnt/my-share
```

## On client Synology (mounting NFS from one Synology to another)

1. Open "File Station"
1. Create a shared folder
1. Create a directory in the shared folder
1. Go to "Tools" -> "Mount Remote Folder" 
1. Use the IP address of the other Synology: the mDNS name did not work for me
   even with several attempts. I set the host Synology's IP as static from the
   router.


# Additional apps

- [Jellyfin media server](https://jellyfin.org/)
- [Synology Photos](https://www.synology.com/en-global/dsm/feature/photos)

# Directory permissions 

Synology uses [ACLs](https://wiki.archlinux.org/title/Access_Control_Lists)
which layer over the traditional Linux file permissions.

NOTE: If your system uses ACLs when you do `ls -al` you will see the character
"+" at the end of the list of traditional Linux permissions.

To see and set the ACLs on a linux system you can use `getfacl` and `setfacl`.
On Synology you can use `synoacltool`.


# System partition getting full

This one was a head scratcher. I went to update my system but got the dreaded
"There is insufficient system capacity for DSM updates" message.

None of the tips in the linked page in the knowledge center applied to me. 

My system partition was indeed very full,
```
$ df -H
Filesystem         Size  Used Avail Use% Mounted on
/dev/md0           2.5G  2.3G   67M  98% /
devtmpfs           5.1G     0  5.1G   0% /dev
tmpfs              5.2G  250k  5.2G   1% /dev/shm
tmpfs              5.2G   19M  5.2G   1% /run
tmpfs              5.2G     0  5.2G   0% /sys/fs/cgroup
tmpfs              5.2G   30M  5.2G   1% /tmp
/dev/loop0          29M  786k   26M   4% /tmp/SynologyAuthService
/dev/vg1/volume_2  3.0T  2.1T  892G  70% /volume2
```
but with what?

For a more detailed break down I tried
```
sudo du -sh --exclude=volume* /* 2>/dev/null
```

The last command excludes the `volume1`,... shared folders that are not part of
the system partition (*Or so I thought.*).

I scoured the interwebs and tried some troubleshooting tips.

I used the builtin `synocleaner` tool

```
sudo synocleaner --delete-all-core
sudo synocleaner --delete-log
sudo synocleaner --delete-journal
```

But it didn't free up much space. I just didn't have so much on my system
partition, and packages that I installed (Jellyfin, Synology Photos) were well
behaved and installed themselves outside the system volume.

Then I ran into [this
thread](https://community.synology.com/enu/forum/17/post/36599). The person
claimed that `/volumeUSB1` was carrying some intermediate data. 

I was skeptical, but ...

```
$ df -h /volumeUSB1
Filesystem      Size  Used Avail Use% Mounted on
/dev/md0        2.3G  2.2G   61M  98% /
```

Whaaaaaat? _That_ is mounted on the *system volume*??

I looked into that folder. The folder and its contents appeared only when I
ssh-ed into the server, not on the GUI File browser. The data appeared to be our
family photos which were clearly on a different partition (`/photos`) which was
mounted on the data volume. 

Long story short, after doing some experiments to verify that this was indeed
some kind of duplicate junk data and not somehow my real data, I blew away the
folders there.

```
$ df -h /volumeUSB1
Filesystem      Size  Used Avail Use% Mounted on
/dev/md0        2.3G  1.4G  849M  62% /
```


# Additional software repositories

- Add `https://synocommunity.com/` to Package Sources in Package manager.
- `mosh` is found in it's own package
- `tmux` is found in SynoCLI Network Tools
