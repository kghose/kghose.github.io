---
title: Linux command reference
permalink: linux-tips/linux-command-reference
last_modified_at: 2025-09-29
---

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

System sleep. Look in [this file][pmi_ss] for details.

[pmi_ss]: https://www.kernel.org/doc/Documentation/power/interface.txt

```
cat /sys/power/state
cat /sys/power/mem_sleep
cat /sys/power/disk
```

Mask (disable) particular sleep states.
Use `unmask` to reenable.
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
 

Networking interface configuration 
```
ifconfig
```


Trace route to host 
```
mtr 8.8.8.8
```

List directory contents recursively
```
ls -R
```

Redirect stdout of `cmd` to `std.out` and stderr to `std.err
```
cmd > std.out 2> std.err
```

Redirect stdout and stderr to `out.txt
```
cmd 2> out.txt
```

Size of directory 
```
du -sh <directory>
```


Used and free sizes of all mount points 
```
df -H
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
