---
layout: page
title: Thoughts on generative A.I. 
permalink: /generative-ai/
last_modified_at: 14-03-2026
--- 

As a kid I was deeply into sentient robots. A large part of my working life was
spent studying how the brain computes. I work in computing. I didn't see
Generative A.I. coming until after it went mainstream. I wasn't paying
attention.

I have some [philosophical notes](/generative-ai/philosophical) on what the fact
that Generative AI exists says about human language, human thinking and being
human.

I have some thoughts about what [Generative A.I. _is_](/generative-ai/hive-mind).

Right now, I think generative A.I. is [the end stage for
search](/generative-ai/search) that I never anticipated.


## My current uses for generative A.I.

(Some of these experiences are from work, where we have access to in-house
developed tooling)

### Figuring out what the hell I need to do

(I initially I titled this as "Search", but the more I thought about it, the
more I realized this was search++. It was much more than just search)

At work (and at home), my most common use for generative A.I. is [for
search](/generative-ai/search). In some cases it has replaced me cold calling
people for information, in most cases it has replaced me looking up code
snippets on our internal code base or on stackoverflow, and in many cases has
replaced looking through pages and pages of documentation and notes. 

I've never been afraid to jump into the deep end of a pool I've never been in
before, but it always needed a lot of blind thrashing around, keeping notes,
searching and experimenting.

Generative A.I., with its magical mix of retrieval and generation just makes
that whole process more efficient and fast paced. This is actually better for my
impatient nature, which always fights against having to go through pages and
pages of dry documentation.

It's nice to have my machine assistant do that work for me.

There is a camp of thought that says this takes away from the learning process.
That by reducing the struggle and the blind ends of the older learning method,
it impoverishes what we actually learn during the process.

My philosophy is that we are plumbers trying to fix toilets. This is neither
philosophy nor basic science. It's OK to just fix the problem and move on. We
don't need to become absolute masters of everything we touch, especially in
tech, where technical details change all the time.

**I think, instead, we become better and better at self-management and
understanding the bigger picture of what we are doing and less and less hindered
by the yak-shaving and niche knowledge silo aspects of our job.**


### Auto-complete 

Auto-complete was the first code generation application that felt like it
had promise. About a year ago now (Early 2025) I recall excitedly telling a
colleague how the generative auto-complete had finished about ten lines of Python
for me, having picked up the pattern of my first few lines.

Provided I wrote the code in a certain order and named variables well,
auto-complete was soon doing things like filling in calls to a function I had
just defined with the proper arguments and proper changes to the local code.

Of course generative auto complete is already quaintly obsolete in 2026. Now we
have "agentic coding" that generates whole projects consisting of multiple files.
I haven't quite caught up yet.

### Code review

Automated code review I didn't have in my forecast. We're not quite ready to
hand over the LGTM keys yet, but I've had AI code reviews catch genuine errors
in code that my colleagues say they would have missed. It's also raised issues
with things that were clearly not issues, but I'd rather have to look more
closely at my code than let something slip.

Watch this space ...


### Analysis code

For some reason the coding agent at work is absolutely fabulous at writing
analysis code. Over the course of a month or so (March 2026) I went from
handwriting Pandas and Matplotlib code to just giving the coding agent brief one
paragraph directives of what kind of metrics I wanted and how to plot them.

It has been fabulous.


### Debugging and rubber duck debugging

It's getting better, but it's not magic. Basically, if an issue is common and/or
has answers on a forum then the A.I. will be able to use that. 

It's a step up from searching for the error message string and piecing together
the root cause because the A.I. brings to bear a lot more context (e.g. the code
base) and is able to try out solutions as well by itself. 


### Writing test cases

Test cases often have a ton of boilerplaty code. Happy to have the machine
hammer this out and, as a bonus, check most of the logic in the code I just
added. I then go in and tweak as needed.


## What I don't use generative A.I. for

I don't use Gen AI for **writing** either at work or for pleasure. 

At work the big writing work is design documents. The writing is actually to
organize my thoughts, often to _actually think_ and to _think together with
other people_. 

I can't imagine using AI for the writing I do for pleasure. It would take the
fun out of it. 

For this reason, Gen AI is not a good use case for my writing. 

I don't use AI for **generating whole files**. As an experiment I did use it to
create a bash script. I was impressed enough by the result, but ran into the
80/20 problem. The 80/20 problem is that I could get 80% of the job done with my
initial prompt, but then the system settled into some kind of weird local
minimum where no amount of prompting could get it the 20% of the way past its
initial mistakes and limitations.

I will admit, however, that as of March 2026, the agents have gotten a lot
better at tweaking the output based on recommendations.

