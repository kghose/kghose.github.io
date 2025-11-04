---
title: Neo(Vi(m)) buffers, views, splits and tabs
permalink: linux-tips/vi-buffers
last_updated_at: 2025-11-03
---

The Vi series of editors became more powerful to use once I finally understood
the concepts behind _buffers_ and _views_.

# Buffers and views

In Vi you can open a file (`:edit file1.txt`) and then open another one (`:edit
file2.txt`). After the second command the editor will be showing you
`file2.txt`. Unlike GUI editors, however, `file1.txt` isn't really forgotten.
It's still in memory in a _buffer_. It's just that the _view_ isn't showing it.

You can type `:b TAB` to list all the available buffers and get the current
_view_ to show a buffer you choose.

A buffer is kind of like a tab in a GUI editor, but is actually much more
powerful.

# Split view

A split breaks the window vertically (`:vsplit`) or horizontally (`:split`)
into multiple views each of which can show a buffer. These buffers can be _same
or different._

Now you see how powerful this is. I can load up a file (which is in a buffer
now) and then split the view into two halves and I can view different parts of
the same buffer (file) in the two views. These are live views: I can edit two
different parts of the same file in the two views.

If I load multiple files, I can use the `:b` command to switch which buffer is
show in a given view.

# Tabs

Tabs are yet another layer on top of this. Tabs allow us to have multiple
windows in the application. Each window can have different splits and different
views onto any buffer, including the same buffer viewed multiple times across
tabs.

Once I understood buffers and splits I stopped using tabs.

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
