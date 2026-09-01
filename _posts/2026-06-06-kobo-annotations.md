---
layout: page
title: DIY Kobo annotation backup 
permalink: /computer-projects/kobo-annotations 
date: 2026-06-06
tags: kobo
---

**Problem**: Kobo has an "Export Annotations" function for owned (DRM or
non-DRM) ebooks but not for borrowed ebooks. I make annotations on all my books
and I like to refer to them afterwards.

**Solution**: It is possible to use the data on your Kobo to create a pdf
document containing all the annotations you have made in a library book using
the following script (Needs Python3 and ImageMagic installed):

(I previously had a Bash version of this script, but decided Python was a better
glue script. I considered writing this in Golang, but the Golang sqlite library
situation is complicated while sqlite3 is one of the "batteries included" with
Python.)

<script src="https://gist.github.com/kghose/8327d0fe35a770c6632e6ba903cff4f8.js"></script>

## Details

### Raw files

The `/.kobo/markups` directory contains pairs of files that look like

```
<string of hex>.jpg
<same string of hex>.svg
```

These are pairs of page screenshots and your annotations in .svg format.

They can be combined using ImageMagick

```
magick composite -compose multiply "${KOBODIR}/markups/${id}.svg" "${KOBODIR}/markups/${id}.jpg" annotation-${idx}.jpg
```

where idx is a counter we set up to get sequential images which we can then
stitch together as

```
magick annotation*.jpg notes.pdf
```

How do we get the proper ids?

### Database

Your reader has an [sqlite] database `/.kobo/Koboreader.sqlite` with two
pertinent tables: `content` and `Bookmark`

Pertinent columns in the `content` table are 

```
ContentID
BookTitle
```
Pertinent columns in the `Bookmark` table are

```
ContentID  -- Lets us join on the content table
BookmarkID -- This is the hash/id the file names use
ChapterProgress -- Fraction from 0 to 1 that allows us to order the notes
```

The following query will get us all the bookmark IDs for annotations for a given
book

```
SELECT Bookmark.BookmarkID FROM Bookmark, content
WHERE 
  content.ContentID = Bookmark.ContentID
  AND (Type='markup' OR Type='highlight' OR Type='note')
  AND content.BookTitle LIKE ? 
ORDER BY content.VolumeIndex ASC, Bookmark.ChapterProgress ASC
```

The thing I found confusing was how to sort the annotations in page order.
`ChapterProgress`orders the annotations within a chapter, and
`content.VolumeIndex` _seems_ to order by chapter. 


## Notes on exploring sqlite databases

You can explore your database with `sqlite3 --readonly Koboreader.sqlite`. For
such wide tables (lots of columns) I like to use `.mode line` to see each column
and its value on a separate line.

## A note on Kobo

The whole database is fun to explore. In general I'm a very big fan of Kobo
because it is possible to poke around inside and even hack it. Kobo publishes a
lot of [open source stuff](https://github.com/kobolabs) and people have
developed layers on top of the OS (e.g. [NickelMenu]) including a custom reader
app ([koreader])

[NickelMenu]: https://pgaskin.net/NickelMenu/
[koreader]: https://koreader.rocks/

