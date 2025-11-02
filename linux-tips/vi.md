---
title: Neo(Vi(m)) buffers, splits and tabs
permalink: linux-tips/vi-buffers
last_updated_at: 2025-11-01
---

# Buffers

In Vi you can open a file (`:edit file1.txt`) and then open another one (`:edit
file2.txt`). The editor now shows you `file2.txt`. Unlike GUI editors
`file1.txt` isn't really forgotten. It just in a buffer and you can type `:b
TAB` to list all the available buffers and switch to one of them.

In this respect a buffer in Vi does the same job as a tab in a GUI editor.


# Splits

A split breaks the window vertically (`:vsplit`) or horizontally (`:hsplit`)
into multiple views each of which can show a buffer. These buffers can be same
or different.

# Tabs

Tabs allow us to have multiple windows.

# Example

I'm revising my novel. I have an outline, the old version of the manuscript and
the new version of the manuscript. 

I primarily edit MS v2 while refering to the outline, and periodically copy over
chapters and sections from MS v1.


My prefered layout is to do a vertical split, have the outline/old MS open in
the left split (as two buffers) and the new MS open on the right. 

```
----------------------------------
|               |                |
|  Outline/     |                |
|  MS v1        |    MS v2       |
|               |                |
----------------------------------
```

You can even script NeoVim to open up this arrangement at startup:

```
nvim -c ":e outline.md | :e ms_v2.md | :vs ms_v1.md"
```
