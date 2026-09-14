---
title: "Squishy Squares: A numerical curiosity involving square roots"
layout: post
permalink: /squishy-squares 
date: 2024-09-17
---

A few days ago my spouse found a post on a social media site that claimed you
could find the square root of a number with an even count of digits by adding
the lower half of the digits to the upper half. 

Given as examples were 81, 2025 and 494209 (This last number doesn't even _look_
like a square, right?). 

You can quickly show this is not general by taking 25, 3600 and 160000 as
counter examples. But, obviously, at least a few such numbers exist. Can we find
more of them?

I'll call them squishy squares, defined as a number with an even number of
digits whose square root is the sum of the top and bottom half of its digits.

I wrote [a brute force
program](https://github.com/kghose/euler/blob/master/z-squishy-square.cpp) to
find all the squishy squares up to 18 digits (Yes, a limit imposed by uint64 for
those familiar with 64 bit machines).

```
[coding] ~/Coding/euler$ ./squishy 9
81
2025
3025
9801
494209
998001
24502500
25502500
52881984
60481729
99980001
6049417284
6832014336
9048004641
9999800001
101558217124
108878221089
123448227904
127194229449
152344237969
213018248521
217930248900
249500250000
250500250000
284270248900
289940248521
371718237969
413908229449
420744227904
448944221089
464194217124
626480165025
660790152100
669420148761
725650126201
734694122449
923594037444
989444005264
999998000001
19753082469136
24284602499481
25725782499481
30864202469136
87841600588225
99999980000001
1322314023140496
1511956823764321
1968106024682281
1982524424700304
2499500025000000
2500500025000000
3077414824700304
3095437824682281
3735179023764321
4049586823140496
4776996021345856
5587185018875625
5662190018625625
6436359815863329
6516844815558529
6957134013838096
7457814011780496
7901234409876544
8434234407495744
8934133805179209
9999999800000001
110888778222110889
186997808245434624
322132944245434624
444889444222110889
585886298179545801
999999998000000001
```

One fun pattern that emerges from this, and which can be shown to continue
indefinitely, are the squares of the nines (9, 99, 999, ...)

![](/articles/squishy-squares-screenshot-from-2024-09-15-22-36-11.png)

(Update 13-09-2026: Forgot to add the proof): 

```
x   = 99 .. 99 (n digits)
    = 10^n - 1
x^2 = (10^n - 1)^2
    = 10^2n - 2 * 10^n + 1


   10^2n            = 100 .. 00 00 ... 00
   2 * 10^n         =         2 00 ... 00
------------------------------------------
10^2n - 2 * 10^n    =  99 .. 98 00 ... 00
      + 1           =  99 .. 98 00 ... 01

        99 .. 98
+       00 .. 01
-----------------
        99 .. 99 = x
```

This also means that there are definitely an infinity of squishy squares.

That'll be a nice ice breaker at the next biker convention.

PS: Staring at the numbers for a while I realized, that up to this range at
least, the first digit of the lower half will be 2,1 or 0
