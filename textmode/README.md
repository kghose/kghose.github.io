---
title: Text Mode Magic
permalink: textmode
last_modified_at: 2025-11-11
---

The fixed width font terminal has a certain _aesthetic_ to it that appeals to
me. Most likely it's some misplaced nostalgia for primitive computing, even
though I started out my computer journey enamoured of GUIs.

# wttr.in: What's the weather like?

```
$ curl wttr.in

Weather report: Medford, Massachusetts, United States

      \   /     Clear
       .-.      +51(48) °F     
    ― (   ) ―   → 9 mph        
       `-’      9 mi           
      /   \     0.0 in         

```

I was amazed to find this service. No API key, no subscription, they guy just
gives it away for free.

More info [on github](https://github.com/chubin/wttr.in)


# delve: Debug Go like it's 1975

[Delve](https://github.com/go-delve/delve) is a terminal based Go debugger. It's
easy to use and awesome and reminds me how the constraints of a terminal can
lead people to make elegant tooling.

```
$ dlv debug
Type 'help' for list of commands.
(dlv) break main.main
Breakpoint 1 set at 0x4e5fd6 for main.main() ./main.go:80
(dlv) continue
> [Breakpoint 1] main.main() ./main.go:80 (hits goroutine(1):1 total:1) (PC: 0x4e5fd6)
    75:			return false
    76:		}
    77:	
    78:	}
    79:	
=>  80:	func main() {
    81:	
    82:		primes, prime_list, _ := load_primes()
    83:		fmt.Println(fmt.Sprintf("Loaded %v primes", len(primes)))
    84:	
    85:		truncatable_primes_sum := 0

```



# OpenSCAD

[It’s a text driven CAD tool.](https://openscad.org/index.html)

![](https://openscad.org/assets/img/tridimake-tutorial.png)

A lot of us have used CAD, and CAD is the poster child use case for graphical
interfaces. 

There are many [grainy videos](https://youtu.be/3wrn9cxlgls) of amazing computer
demos from the 1960s. Some historical guy is demonstrating this amazing thing
they’ve built that pushes the ancient computer technology to it’s limit, and it
is almost always about how no one is going to use keyboards any more.

They will be using mice, or light pens or haptic gloves. And the poster child
application is often a CAD. Look how we can design this rocket by drawing three
dimensional cylinders! 

So it is all the more breathtaking to find a modern CAD application that is text
driven.
