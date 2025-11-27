---
title: Thinkpads
permalink: /thinkpads
layout: page 
last_modified_at: 2025-10-12
---

![](/linux-tips/three-thinkpads.jpg)


# X220

I have one that was built in 2012. I added an SSD and run Ubuntu on it. You can
get cheap and poor quality batteries off eBay. It was the first time I was
exposed to the special Thinkpad black rubbery coating. Some people hate that
color and coating. I like the feel of it a lot.

Some people love the keyboard. I do like the feel and travel of it, but the 
keys are a bit noisy. 

It's also quite a small form factor - smaller than 13" even, which makes it look
quite compact against a modern 14". The form factor is great for writing on the
train, but the screen and touch pad are a bit cramped for other work.

The power consumption is high compared to the other machines I have. Just
browsing and writing will pull 15W! In comparison my T14 G1 pulls 3.5W for such
tasks.

It's reputation as a tank is well deserved. 

I once walked through a downpour and water got into my backpack and then into
the beloved X220. I didn't notice until later in the day. 

I turned it on and the whole display was flickering and there was a giant
diagonal splotch on the LCD. I was devastated. I turned it off (it had been
sleeping in my back back) took out the battery and put it my desk.

I waited 24 hours before plugging it in without the battery. The display had
stopped flickering and the giant diagonal splotch was now a smaller splotch
covering less than a quarter of the display.

The next day the splotch was even smaller. By the end of the week, it was as
good as it had been when I first got it many years ago.

# T14 G1

They got the _feel_ of it right. It's slim, substantial (i.e. heavy for its
size) and sturdy. Nothing wobbles. All the parts fit together precisely. And of
course, it has that matte black semi-rubberized grip that I personally like.

I like the keyboard, perhaps even more than the X220's one because it is quiet
_and_ feels good to type on. 

The keys are shallower than the X220 but the have a nice non-linearity to their
pressure - there is a distinct "snap" near the end of the travel that feels good
on the fingers. 

Typing fast makes a rapid pattering noise that is acceptable and the snaps give
good feedback. 

The down cursor key has a raised ridge, making position the fingers on the
[navigation cluster](#navigation-keys) more convenient.   

(Here we take a swipe at whatever abomination Apple puts on their machines:
somehow simultaneously noisy, spongy, and feel like the world's shallowest
popits)

I have the lowest end i5 (Intel) version and it works just fine browsing,
writing and compiling code. It's also very power thrifty, barely breaking 5W and
most of the time sitting at 3.5W. 

The fan stays off under the "Power Saver" setting under GNOME, which sets the
CPU governor to `powersave` which keeps the CPU frequency under 800 MHz.

I have the 45% NTSC, 300 nit touchscreen. It's what I could find. I don't really
need the touchscreen and I'm not too fussy about color. The 300 nits is bright
enough for working outdoors in sunlight. 

This is my current favorite and I think I'll be able to use it until it
completely falls apart. Fedora 42 runs excellently on it
[with a few annoyances](/fedora42-t14g1).


## Battery life

Battery life with a three year old battery which is at 90% design capacity
(50.45 Wh design, 45.95 Wh currently) is phenomenal. For my typical task of
writing things using a terminal based editor, I see about 3.5W or 10% battery
charge per hour of working, which translates to about 7-8hrs of working time
since I usually charge the battery to 80%.

At 100% brightness on the 45% NTSC 300nits screen I burn about 7W while browsing
and writing.

I was a little worried by notes from people online saying that the Intel
motherboards were terrible at power consumption and gave very poor battery life,
but I see nothing concerning here.

# E14 G4 

**(Unfairly compared to the T14 G1)**


On paper the E14 has a better build because it has a metal lid. However, The
T14's plastic and glass fiber body feels slimmer and stiffer and lighter while
the E14 feels bulkier, more plasticky and flimsy. 

The fact that mine has a gray plastic casing as opposed to the traditional black
rubberized shell doesn't help, and it's annoying when the paint rubs off.

The keyboard of the E14 G4 is similar to that of the T14 G1 and the sizes are
similar. The speakers on the E14 aim downwards for some reason and are too soft.
I don't think they pass even for business use. Perhaps the assumption is that
everyone is using a headset.

The camera is a ThinkPad quality camera, which is to say, pretty crappy given
the standard Apple has set for us.

The one I have has the 250 nit touchscreen and it is difficult to use outdoors.

Functionally, the E14 G4 (i5-1235U) is ahead of the T14 G1 (i5-10210U) but it
seems to draw a bit more power during my tasks (writing and light browsing) and
I don't really use the extra oomph. 

All in all, I prefer the T14 G1 over the E14 G4 by far. The current plan, when
the T14 dies, is to replace it with another T14, probably a G6, and keep the E14
around as the backup.

# Using the track point

There is a joke that no one uses the trackpoint and to be honest it took me over
a decade to actually try using it. Once I got in some practice, however, I'd say
it is superior to the touch pad. Thinkpad's placement of the buttons right below
the space bar is especially ergonomic. 

I can mover the cursor faster and with much less finger movement, compared to
the touchpad. Left clicks are conveneient. Scrolling, which involves holding the
middle button down while pushing on the trackpoint, is particularly more
comfortable than swiping with two fingers. 

Only the right click is a little awkward (I have to bend my thumb to get to the
button) but the fact that middle click opens links in a new tab in Firefox means
I have to use the right click far less often.

# Navigation keys

I was first exposed to the five navigation key cluster on the X220 and I _hated_
it. I'd fat-finger the PgUp/Dn keys when aiming for the cursor keys and would
lose my place in the document.

I began to appreciate them more when I got to the slightly larger E14/T14
keyboards _and_ learned to use the GNOME Mode key window management shortcuts.
For example the Mode + Arrow keys tile the windows while Mode + PgUp/Dn keys
switch workspaces.

