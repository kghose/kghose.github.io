---
title: "Squishy Squares: A numerical curiosity involving square roots (II)"
layout: post
permalink: /squishy-squares2 
date: 2026-09-15
---

(Part [1](/squishy-squares) has some background to the problem)

Squishy squares are squares like 81, 2025, 9801 whose square root is the sum of
the top half digits and bottom half digits.

So $$\sqrt{81} = 9 = 8 + 1$$

We can do some analytical tinkering on the problem as follows:

Let $$x, y$$ be the top and bottom half digits of the square, so the squishy
square takes the form $$10^nx + y$$ and $$z$$ is the root.

$$
z = x + y \\
z^2 = 10^nx + y \\
(x + y)^2 = 10^nx + y
$$

Where 

$$
0 \leq y \lt 10^n \\
10^{n-1} \leq x \lt 10^n
$$

We can reorganize this as a quadratic in x:

$$
x^2 + (2y - 10^n)x + y^2 - y = 0
$$

Using the quadratic formula we can write

$$
x = \frac{(10^n-2y) \pm \sqrt{10^{2n} - 4*10^ny + 4y}}{2}
$$

For y = 0 we get $$x = 0$$ or $$x = 10^n$$, which aren't valid

For y = 1 we get $$x = 10^n - 2$$ which explains 81 and 9801 and so on.

Sadly, I can't think of any further to go with absolute values of y.

I'll try something else later ...


## Appendix: root and squares

I was revisiting my older article and realized that I had missed an opportunity
to find more patterns in the numbers by not printing the roots alongside the
squares.

After a [quick refactor of the
code](https://github.com/kghose/prototypes/blob/master/squishy-squares/brute.cpp)
I printed out the roots and squares (see end of article).

I was about to disappear into several rabbit holes (Look at 45, 4950, 351352,
499500, there's _definitely_ something there) when I started to do my analytical
tinkering.


```
9          -> 81
45         -> 2025
55         -> 3025
99         -> 9801
703        -> 494209
999        -> 998001
4950       -> 24502500
5050       -> 25502500
7272       -> 52881984
7777       -> 60481729
9999       -> 99980001
77778      -> 6049417284
82656      -> 6832014336
95121      -> 9048004641
99999      -> 9999800001
318682     -> 101558217124
329967     -> 108878221089
351352     -> 123448227904
356643     -> 127194229449
390313     -> 152344237969
461539     -> 213018248521
466830     -> 217930248900
499500     -> 249500250000
500500     -> 250500250000
533170     -> 284270248900
538461     -> 289940248521
609687     -> 371718237969
643357     -> 413908229449
648648     -> 420744227904
670033     -> 448944221089
681318     -> 464194217124
791505     -> 626480165025
812890     -> 660790152100
818181     -> 669420148761
851851     -> 725650126201
857143     -> 734694122449
961038     -> 923594037444
994708     -> 989444005264
999999     -> 999998000001
4444444    -> 19753082469136
4927941    -> 24284602499481
5072059    -> 25725782499481
5555556    -> 30864202469136
9372385    -> 87841600588225
9999999    -> 99999980000001
36363636   -> 1322314023140496
38883889   -> 1511956823764321
44363341   -> 1968106024682281
44525548   -> 1982524424700304
49995000   -> 2499500025000000
50005000   -> 2500500025000000
55474452   -> 3077414824700304
55636659   -> 3095437824682281
61116111   -> 3735179023764321
63636364   -> 4049586823140496
69115816   -> 4776996021345856
74747475   -> 5587185018875625
75247525   -> 5662190018625625
80226927   -> 6436359815863329
80726977   -> 6516844815558529
83409436   -> 6957134013838096
86358636   -> 7457814011780496
88888888   -> 7901234409876544
91838088   -> 8434234407495744
94520547   -> 8934133805179209
99999999   -> 9999999800000001
332999667  -> 110888778222110889
432432432  -> 186997808245434624
567567568  -> 322132944245434624
667000333  -> 444889444222110889
765432099  -> 585886298179545801
999999999  -> 999999998000000001
```

