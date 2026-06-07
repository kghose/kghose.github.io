---
layout: post
title: DIY Kobo annotation backup 
date: 2026-06-06
tags: kobo 
---

**Problem**: Kobo has an "Export Annotations" function for owned (DRM or
non-DRM) ebooks but not for borrowed ebooks. I make annotations on all my books
and I like to refer to them afterwards.

**Solution**: It is possible to use the data on your Kobo to create a pdf
document containing all the annotations you have made in a library book using
the following script (Needs sqlite and ImageMagic installed):

```
#!/bin/sh
set -x

if [[ $# -lt 2 ]]; then
	echo "Usage: $0 <book name> <outfile>"
	exit 1
fi

BOOKNAME=$1
OUTFILE=$2

KOBODIR="${HOME}/Documents/Kobo-backup/.kobo"

# Create a temporary directory and store its name in a variable.
TEMPD=$(mktemp -d)

# Exit if the temp directory wasn't created successfully.
if [ ! -e "$TEMPD" ]; then
    >&2 echo "Failed to create temp directory"
    exit 1
fi

# Make sure the temp directory gets removed on script exit.
trap "exit 1"           HUP INT PIPE QUIT TERM
trap 'rm -rf "$TEMPD"'  EXIT

echo "Created temp dir."

PARAM=".param set :bookname %${BOOKNAME}%"
QUERY="SELECT \
Bookmark.BookmarkID \
FROM Bookmark,content \
WHERE \
content.ContentID = Bookmark.ContentID \
AND content.BookTitle LIKE :bookname \
ORDER BY Bookmark.ChapterProgress"

BOOKMARK_IDS=$(sqlite3 --readonly -batch -noheader "${KOBODIR}/KoboReader.sqlite" "${PARAM}" "${QUERY};")

count=0
for id in ${BOOKMARK_IDS}
do
    idx=$(printf "%04d" $count)
    echo "Processing page ${idx} of annotations."
    magick composite -compose multiply "${KOBODIR}/markups/${id}.svg" "${KOBODIR}/markups/${id}.jpg" $TEMPD/annotation-${idx}.jpg
    count=$((count+1))
done

magick "$TEMPD/annotation*.jpg" ${OUTFILE} 
```

There is a quoting issue in the script if `BOOKNAME` contains a `'` that I
haven't bothered to solve. 


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
SELECT 
 Bookmark.BookmarkID 
FROM Bookmark,content 
WHERE 
 content.ContentID = Bookmark.ContentID 
 AND content.BookTitle LIKE '%<my book>%' 
ORDER BY Bookmark.ChapterProgress
```


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

