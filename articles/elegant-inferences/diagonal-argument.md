---
layout: page
title: Infinity and beyond (Cantor's diagonal argument)
permalink: /elegant/cantor-diagonal
last_modified_at: 12-09-2026
---

Many of us get a rush when we learn about infinity. Our immediate physical world
is finite, and we have dim appreciation than even things like the number of
grains of sand on all the beaches of the world are finite. So infinity really
stretches the mind.

The farthest I personally got with infinity was the fascinating and elegantly
simple demonstration that there are multiple levels of infinity: some things are
more infinite than others. This is due to Cantor, and is called Cantor's
diagonal argument.

The first infinity, and the one most of us get to, is "countable infinity" and
is the notion that the natural numbers 1, 2, 3, ... go on for ever.

So, if 1, 2, 3, ... goes on for ever, how can there even be something more?

Cantor's magic trick is something else. Here it is. Don't blink. Keep your eyes
on the cards.

Let us construct an infinite sequence of 1s and 0s (a binary stream) like
`10000000000000 ...`. Let us construct an infinite number of such streams, so we
end up with an infinite roster of sequences each with an index number:

```
1  1000000000000 ...
2  0100000000000 ...
3  1100000000000 ...
4  0010000000000 ...
5  1010000000000 ...
...
```

We can see there is a systematic way we can build this roster of sequences, and
we can interpret them simply as the infinite sequence of natural numbers written
out in binary (backwards, with infinite padding etc.)

We also see that by labeling these sequences 1, 2, 3, 4 ... it _seems_ that for
each such sequence we have a corresponding roster label. Seems logical: we can
think of the stream as a binary representation of the corresponding number.

Now that we have been lulled into a sense of complacency, Cantor springs a
brutal intellectual ambush. It's so brutal we don't even see it, even
though we've been told we are being ambushed. Right. Now.

Let us, Cantor suggests, do some cross-checking. 

Let us construct a sequence `C` as follows:

1. Take the first digit of sequence 1 and flip it. In our case we have `1 -> 0`
   This is the first digit of `C`.
1. take the second digit of sequence 2 and flip it. Here it's again `1 -> 0`
   This is the second digit of `C`.
1. Keep doing this.

At this stage we have

```
C  00111 ...
```

`C` is just a sequence of `1`s and `0`s, so it must be part of this _infinite_
list of sequences we have, right? 

So, asks Cantor, please look into our infinite roster of all such sequences _in
the universe_ and tell us what is the index, the roster number, of `C`.

This is an easy task. Let's go down the roster systematically.

1. It can't be 1: The first digit is different. 
2. It can't be 2: The second digit is different.
3. It can't be 3: The third digit is different.

...

Now do you see it?

This sequence _can't_ be in the roster. 

**There is something missing from our _infinite_ roster.**

I see the proof, I know it's correct, but I can't accept it! I feel something
like outrage at this travesty.

The card trick here, the sleight of hand, I suspect, has something to do with
the fact that these are _infinite_ sequences. We have an infinite list of
infinite sequences and there is something squirmy there.

Regardless, the proof is clear. No matter how you look at it, there are more of
these infinite sequences than there are infinite natural numbers.

When I think about this, I can't go to sleep.

