# GNOME

```
gnome-shell --version
```

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

## Extensions
- [Forge](https://github.com/forge-ext/forge) - Tiling manager.
- [Argos](https://github.com/p-e-w/argos) - Commandline -> GNOME shell extension
- [Stocks Extension](https://github.com/cinatic/stocks-extension)

### Needed separately on openSUsE
- Dash to Dock
- AppIndicator and KStatusNotifierItem Support


### Logs (e.g. to debug an extension not starting)

```
journalctl /usr/bin/gnome-shell -S "2024-05-12 22:00"
```

### Run a mini gnome session!!
```
dbus-run-session -- gnome-shell --nested --wayland
```

