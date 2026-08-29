---
title: "মৌলিক: A prime number toy"
date: 2017-09-27
categories: 
  - "best-of"
  - "coding-diary"
tags: 
  - "arduino"
  - "hardware"
  - "microcontroller"
coverImage: "coronal-display-featured.jpg"
permalink: /computer-projects/moulick
---

Moulick (মৌলিক - Bengali for Prime) is an Arduino powered mathematical toy that endlessly computes primes and shows fun statistics about them as it goes along. Watching primes born was never more exciting, or slow. Moulik  starts from 2 and takes you primally all the way out to 10 decimal digits at a recklessly unsafe speed (for an Arduino, that is)\*.  Here's a video of Moulick in action.

\*_10 decimal digits will not be achieved in a single lifetime. Your mileage may vary. Offer void where prohibited by law. Primes are facts of nature and can not be owned, bought, sold or patented._ 

https://www.youtube.com/watch?v=VL-EnUDCtP4

As a kid I was really into electronic circuits and microprocessors and robots. I still am, but a day job that also involves computers and (when I was a postdoc/grad student) electronics, dampens the ardor for tinkering at home. I do more gardening and woodwork nowadays when I get the time. This is my excuse for not having done an Arduino project yet. But, better late than never!

I was inspired by Karl Lautman's "[Primer](http://www.karllautman.com/primer.html)" toy.  Primer requires you to push a button to get to the next prime and is limited to 6 or 7 digits. It's main charm is that it noisily clacks from one prime to another as it uses a mechanical counter as it's display.

Moulick's primary (heh heh) charm lies in watching it whizz past the smaller primes and then slowly get bogged down leaving you to bite your nails as you wait to find out if that next number is a prime, or just a very nasty composite and cheer when twin primes find themselves next to each other and gasp when an even rarer palindromic prime makes an appearance.

\[caption id="attachment\_5900" align="alignnone" width="2000"\]![OLYMPUS DIGITAL CAMERA](https://kaushikghose.wordpress.com/wp-content/uploads/2017/09/coronal-display.jpeg) Moulick's default Coronal display\[/caption\]

For a more detailed description of the toy please see the [github page](https://github.com/kghose/moulick) which has a comprehensive readme file.

## Hardware

The hardware is an Arduino Uno and a 2.8" TFT display shield. For those who don't know, an Arduino _shield_ is a component that has been designed to plug directly on top of the main Arduino board without needing any extra cabling. (On the other hand, a _module_ is a component that attaches to the Arduino using some kind of cable.)

### A tiny color touchscreen that let loose my imagination!

I fully accept that I may gotten too excited about this gizmo, but I still can't get over that, for a fairly affordable price, I can buy a tiny, sharp, bright, color touchscreen that I can program and make do things!

At first I thought the TFT display was kind of overpowered for what I wanted to do. I was looking more for a simple seven segment display array with the idea that the clock would look a bit like a movie time-bomb, but it would be counting up and displaying primes. Then I saw that the seven segment displays were as expensive, if not more, than the TFT touch-screens being advertised alongside. The fact that this particular device was a shield which I could just plug into the Arduino, clinched it. On a whim, I clicked "buy". That was a fateful decision.

\[caption id="attachment\_5903" align="alignnone" width="2000"\]![OLYMPUS DIGITAL CAMERA](https://kaushikghose.wordpress.com/wp-content/uploads/2017/09/stats-display.jpg) Moulick's stats screen.\[/caption\]

The fact that I now had a small color raster display with TOUCH, really let me be creative. The user-friendliness of the Arduino UNO + Arduino IDE  made a huge difference - I could quickly prototype ideas, SEE how they actually looked on the hardware, how the touch screen responded and so on.

### It's a REAL Arduino project

When I started out I realized that this was kind of a "half" Arduino project because it dealt with a mathematical object (the set of primes) and was invariant to the outside world. Most Arduino projects involve sensors and motors - the core fun is of interaction, where the Arduino serves as the brain that responds to the external world. Indeed, if I had gone with the 7-segment display panels, that's what the project would have been: an Arduino doing some computations internally and ignoring the external world. The touchscreen saved me, however. With the touchscreen, I gained a sensor and had some [challenges](https://kaushikghose.wordpress.com/2017/09/21/debouncing-a-touch-screen/) dealing with the vagaries of sensor input and now technically, the toy responds, though in a limited way, to external input from the user, so it is a REAL Arduino project.

## Software

### IDE

The Arduino is quite a joy to program thanks to the simple but effective IDE. The nomenclature is a bit unfortunate, though. A main program is called a "sketch", ends in .ino and you compile it by clicking "verify" (the check box icon) on the IDE. The .ino file is just a text file with straight C++ code and two entry functions - setup and loop - instead of main. All the code - the .ino and any C++ headers and source files you write should go under a common folder bearing the name of the application.

The compiler can also be invoked from the command line. This is great in principle because it allows me to use my own IDE for code editing. However, the compiler loads the entire IDE application each time, making it quite slow to startup. I ended up leaving the Arduino IDE open just to click the “upload” or "verify" button. Even though the code does not update in the Arduino IDE window when I saved new versions from my own IDE, the compilation would use the latest code from disk. I just had to be careful not to save from the Arduino IDE and overwrite my changes from my “real” IDE.

**Make no mistake however: the Arduino IDE is a great tool and for folks who don’t write C/C++ outside of programming Arduinos it’s an amazing one-stop solution.**

Very helpfully the compiler tells you how much of program memory is used and how much dynamic memory your globals use, and how much is available for local variables. For a UNO this is 2 kB and I imagine there is a satisfying challenge to make sure it all fits into the available space. For my simple application I had no problem with compute resources  _(Oh yes I did, see the next section)_.

### Limited resources. No OOM warning, just strange glitches.

One of the challenges of programming micro-controllers is their typically limited onboard resources. Limited, however, is a relative term. I wrote traditional C++ just as I would have for a desktop machine and almost got away with it. I programmed two screens into the device each with a few widgets that displayed different aspects of the data. I was doing this without a single line of assembly or strange memory/computations saving tricks and I was thinking, wow 2KB is a LOT!

Then it happened. I ran out of memory. But I didn't realize I ran out of memory. What happened was this: I was working on the stats screen. This was an earlier version

\[caption id="attachment\_6056" align="alignnone" width="1062"\]![OLYMPUS DIGITAL CAMERA](https://kaushikghose.wordpress.com/wp-content/uploads/2017/09/older-stats-display-e1506478711973.jpg) An older version of the Stats screen with two histograms\[/caption\]

and I had two histograms, one for first digit frequency and one for last digit frequency. I eventually discarded this because after I prototyped it I realized it was awfully boring, though the histograms themselves looked neat and nice. I wrote up a class for the histogram and then tested things out with just one. Everything looked fine.

So I added the second histogram to the display. It was just a new instance of the existing working class. It worked fine, but now, bizarrely the "Palindromic primes" counter started to mirror the "Primes" counter. Sometimes it would mirror the count, sometimes it would add a little to it and so on. My first thought was that I had done something unsafe somewhere and had lost a pointer and this latest change was just bringing that out.

But, I had taken special care with all the unsafe bits of C++: I had stayed away from them completely. But you never know. As a way to trace the bug, I commented out the line with the new histogram and watched the bug go away. Then I had the idea. Maybe I'm finally running out of memory. The first version of the histogram display was a little memory hungry - each allocated a 9 byte array. You laugh. But we only have 2kB. It goes fast. I eventually rewrote the histogram to not need that memory, and the problem went away.

That's how OOM errors manifest themselves on a microcontroller like this. There is no safety. No one will warn you that you have no memory left to allocate. The allocator will just point you to an already used chunk of memory and then, good luck!

### Arduino.h

One thing that was a little hidden and led me into some confusion is that even without you including it in your main sketch, the header "Arduino.h" is added during to it during compilation. This brings along a lot of the Arduino libraries, notably including [math.h](http://forum.arduino.cc/index.php?topic=44229.0) and String. This is normally great, but I had broken my code into separate .cpp and .h files and at one point I ran into a cryptic compilation error with the compiler saying it didn't know what uint32\_t was, despite the fact that I had just used it in another header. It turned out that I was including this header file in the main sketch and it was recieving Arduino.h from the main sketch, while this other file was part of a separate compilation unit, and so on and so forth.

### Some notes on the ELEGOO 2.8 TFT

The ELEGOO 2.8 TFT is sharp and bright and they supply plenty of source code examples. It is a color display and the supplied code allows you to print text and draw graphics and handle display rotation. The two glitches I had with it are as follows

1. You are instructed to uncomment/comment a line in Elegoo\_TFTLCD.h depending on whether you have the shield or breakout version of the board. In my case, even though I had the shield, I had to keep the line commented for the examples to work
2. When I installed the Elegoo libraries the more advanced examples that show up in the Arduino IDE menu DO NOT WORK. However, if I go into the unzipped folder and select the examples one level up in the directory, they work just fine. I guess there has been a mess-up by Elegoo and they shipped obsolete code in the library folders, while updating the example code one level up (which doesn't get auto installed by the Arduino IDE)
3. While adapting the code I noticed that the tft.readID() function does not work, and the examples hardcoded the id to 0x9341 for the ILI9341 chip which is what I ended up doing.

One thing to note is that I'm not sure of the relationship between AdaFruit's 2.8" TFT and this one. It looks like a clone and the code seems to be modification of the original Adafruit libraries. For $12 on Amazon, it's really nice, thought I worry a little bit if this was AdaFruit's IP that Elegoo stole.

### uint32\_t

I debated whether to make the prime number a uint32\_t (which takes us to four billion) or uint64\_t (which take us to eighteen quintillion). Rough measurements showed that the hardware I used (Uno + TFT display) tests 250 numbers in 9s (or ~ 1600 numbers a minute). This was when testing numbers below one million, and I expect it gets a lot slower as we go to larger numbers.

Conservatively, four billion primes would take more than 5 years to compute sequentially and eighteen quintillion would take a tad longer. I went through a period of mania where I imagined Moulick becoming a cult phenomenon and being buried in a time capsule with a magic battery being dug up by the descendants of man, still ticking. Then I decided to stick with uint32\_t. If you want, though, you can uncomment the relevant lines in prime.h, just in case.

The Arduino sports an 8bit processor, so every operation on a 4 byte number requires 4 clock cycles. The Arduino zips along at 16 MHz, so, yeah, don't enter any "Biggest prime" contests with this.
