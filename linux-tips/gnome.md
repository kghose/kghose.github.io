---
title: GNOME
permalink: linux-tips/gnome
last_updated_at: 2025-10-03
---

# Argos
Follow the instructions on the [page](https://github.com/p-e-w/argos) (git
clone, then symlink. The extensions can also be symlinked). 

**On Ubuntu** we need to enable it via the `gnome-shell-extension-manager`
(`sudo apt install gnome-shell-extension-manager`) 


# CLI

Get shell version
```
gnome-shell --version
```

Shell logs (e.g. to debug an extension not starting)
```
journalctl /usr/bin/gnome-shell -S "2024-05-12 22:00"
```

Run a mini gnome session!!
```
dbus-run-session -- gnome-shell --nested --wayland
```

# Misc config tweaks

## Square windows (Ubuntu 23)

In `.config/gtk-3.0/gtk.css`

```
decoration, window, window.background, window.titlebar, *.titlebar {
  border-radius: 0px;
}
```


## Focus follows mouse
```
gsettings set org.gnome.desktop.wm.preferences focus-mode 'sloppy'
```


## Window buttons

Set which buttons are visible on a window menu bar

```
gsettings set org.gnome.desktop.wm.preferences button-layout 
":minimize,maximize,close"
```


