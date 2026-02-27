---
title: Bad UX in the name of energy savings
layout: post
last_updated_at: 2026-02-26
---

Many modern cars have an auto-stop feature. When you hit the brake and the car
is at a stop the engine turns off. In the car I have, the engine automatically
starts again if you release the brake, turn the wheel or if the engine
temperature starts to fall. To accommodate the increased frequency of starts the
starter motor is (allegedly) designed to be more robust and the battery
(allegedly) had higher capacity.

**There is no way to permanently turn off this feature.** In my car there is a
button, away from all the other control buttons, that disables the auto-stop
while the engine is running. If you stop the engine and restart, you have to hit
the disable button again.

This annoys people so much that an enterprising person sells a device online
that you can plug into the car's OBD port that will automatically disable it for
you.

This has been done in the name of reducing carbon footprint. Over five years our
car has saved us 60 hours of idling, or something. In terms of greenhouse gasses
is that more or less than the extra green house gasses it took to build the
extra robust starter? Unknown. What about the extra pollution it costs to build
the defeat device which wouldn't have a market if the disable button was a
simple ON/OFF toggle that only had to be hit once? Unknown.

Some bean counter somewhere decided that if we make it annoying enough to
disable the auto-stop, it would be used by 99% of the drivers. So here we are.

I only recently noticed that GNOME has done something similar. GNOME has an
option to suspend the machine if you don't use it for X minutes. There _used_ to
be an option under the "Power" settings to disable this suspend on idle.
It disappeared in GNOME. Apparently since whatever GNOME F38 uses. I thought it
was there in F43 but I must have hallucinated that.

The equivalent to the OBD port defeat device is to add a configuration override
that disables the suspend on idle.

In both these cases, an option has been made difficult to use on purpose to
obtain a certification. In this case an energy efficiency certification.

Both of these energy saving "features" can be hazardous or making the device
unsuable under some circumstances. The auto-stop, for example, if hazardous when
the car is parked or stopped on a hill. It will cut out the engine at
inopportune times.

In Linux, if you are logged into your machine remotely (via SSH) the machine
will keep going to sleep on you, making it unsuable unless the configuration
override is added.

On top of this being bad UX, I'm not convinced that these teeny-tiny "savings"
make any difference at all, especially in the face of all the huge amounts of
waste we have from, say private jets, AI data centers and other things.

We should be asking the ultra-rich to be making the cuts, not middle class sedan
owners.

Rant out.
