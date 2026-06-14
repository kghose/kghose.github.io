---
layout: post
title: A most satisfying algorithm 
date: 2026-05-29
tags: hash, algorithm, computing 
---

I ran into a problem at work which is equivalent to the following scenario:

You're having a party and your guests are circulating: new guests come in,
existing guests leave and sometimes come back. There is a zombie game going on.

There are zombies and there are survivors. You start with a small fraction of
zombies and you change it as you go along.

For reasons, once a guest plays a zombie, they must always play a zombie. So, if
a guest comes in and is assigned to be a zombie, they leave and then come back,
they have to be assigned again to the zombie team.

You enlist one of your guests as the game coordinator. The real twist is that
the game coordinator has no means to keep track of who once played a zombie.
They can't memorize the player assignments or write it down.

How can we ensure that team assignments are stable with guest churn and changes
to the zombie fraction?

One solution I find very elegant is as follows

1. Compute the hash of the name (use a function that maps the string to an
   integer) or something else that uniquely identifies the guest.
1. Normalize the integer (divide the hash by the largest possible value) so that
   it is now a float between 0.0 and 1.0
1. If the hash is less than the desired fraction _f_ assign the guest to be a
   zombie.

Changing the fraction adds more or fewer guests to the zombie list but the lists
are stable: a player who plays a zombie at a certain _f_ value will always be a
zombie as _f_ is increased. As long as the hash function is chosen well there
will be no bias in the selection. 

(In this formulation we can have guests who have the same name, of course, so we
do things like first name + last name, or first name + last name + birth month
etc.)


<!-- Add an article about random number generation with different distributions -->
