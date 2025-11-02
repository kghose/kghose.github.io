---
title: Linux command reference
permalink: linux-tips/linux-command-reference
last_modified_at: 2025-09-29
---



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

Show details (including size) of a package 
```
apt show <package name>
```
 




