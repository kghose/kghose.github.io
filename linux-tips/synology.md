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
1. Run Linux
1. Have the apps I need

The Synology Photos application is adequate, though I've had trouble with the
system partition filling up due to the image recognition features.

The Jellyfin server and front ends are spectacular and run well on Synology.


# Additional apps

- [Jellyfin media server](https://jellyfin.org/)
- [Synology Photos](https://www.synology.com/en-global/dsm/feature/photos)


# System partition getting full

Use the builtin `synocleaner` tool

```
sudo synocleaner --delete-all-core
sudo synocleaner --delete-log
sudo synocleaner --delete-journal
```

You can monitor with the usual Linux tools

```
df -H

sudo du -sh --exclude=volume* /* 2>/dev/null
```
The last command excludes the `volume1`,... shared folders that are not part of
the system partition.


# Additional software repositories

- Add `https://synocommunity.com/` to Package Sources in Package manager.
- `mosh` is found in it's own package
- `tmux` is found in SynoCLI Network Tools
