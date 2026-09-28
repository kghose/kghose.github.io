---
title: "AI text watermarking"
layout: post
permalink: /articles/ai-text-watermarking
date: 2026-09-27
---

> "You're sitting watching TV and suddenly you discover a wasp crawling on your
> wrist."

Many Sci-Fi fans will recognize this as a quote from the 1968 Philip K. Dick
book "Do Androids Dream of Electric Sheep?". 

In the world of this book (and the exceptional movie, Blade Runner, based on it)
humans are hunting bio-engineered beings called replicants, originally created
to serve humans, but now going rogue.

Replicants resemble humans so closely that the only way to differentiate them is
to give them a delicate psychological battery called the Voigt-Kampff test.
Subtle physiological cues betray the replicants as not having genuine emotional
responses to the emotionally charged questions in the test. 

The wasp question is one of the more innocuous ones from the battery.

Back to the "real" world which is increasingly resembling worlds from seminal
1960/70s Sci-Fi ...

We are now (late 2026) living in a world where computers routinely produce text
that we can not distinguish from human authorship. [Humans are especially bad at
sussing out "AI slop"][wu2025]

The EU has enacted an AI act that effectively has a watermarking requirement
([Article 50]): AI generated output has to have an easily detectable signature. 

[Article 50]: https://artificialintelligenceact.eu/transparency-rules-article-50/

I could imagine how binary data like video and audio with plenty of metadata
could be watermarked in the metadata. I know superficially about steganography
so I could imagine how watermarks could be hidden in the data itself. (Though it
is another matter how to preserve such watermarks through re-compression, format
changes etc.)

I wanted to know how plain text could be watermarked.


## The technology

I found the introduction in [1][dathathri2024] fun and easy to read and
recommend you do to. Several watermarking techniques are discussed there.

The crudest form is to insert special Unicode characters in the text. Literal
watermarking as it were. I imagine this is pretty disruptive, especially if you
use unsophisticated terminal based readers like I do and start to see blank
boxes scattered through out what you are reading.

More sophisticated techniques embed the watermark as a statistical signature in
the language itself: the choice of words and phrases is controlled deliberately.
A good technique does not affect the quality of the text.

The technique described in ([1][dathathri2024], [2][anthropic2026]) is called
generative watermarking because the watermark is added in the generative phase
itself and is embedded in the statistical pattern of word and phrase choice.

As you may know, a Generative AI system, like a large language model (LLM),
creates output piece by piece.

There is an initial input, called a prompt, which sets off the machine.

```
prompt -> LLM
```

The LLM (language model) produces a small chunk of output, called a token.

```
prompt -> LLM -> Token 1
```

This output token is appended to the text we have so far and then fed back to
the machine

```
prompt + Token 1 -> LLM
```

This in turn produces another token

```
prompt + Token 1 -> LLM -> Token 2
```

And on it goes.

(How does it know when to stop? That's a different post ...)

The token that is produced is actually randomly chosen. The LLM first spits out
a list of likely continuations from its training set ordered by how likely they
are given the preceding text.

The LLM then picks from the more likely of continuations. (Why doesn't it pick
the _most likely_ continuation? That too is a different post)

So one step of the process looks like

```
text + t1 -> LLM -> Sample -> t2 --
  ^                                |
  |                                |
   --------------------------------
```

With the watermark piece added in at the generative stage the cycle looks like
this:


```
Watermarking key 
    |
    V
Seed generator -------
  ^                   |
  |                   V
text + t1 -> LLM -> Sample -> t2 --
  ^                                |
  |                                |
   --------------------------------
```

([This figure][fig1] from the article is way better than my ASCII art ...)

[fig1]: https://www.nature.com/articles/s41586-024-08025-4/figures/1

The initial watermarking key (and the text being generated) affects the seed of
the random process selecting the next token. This subtly alters the words and
phrases the LLM is spitting out.

Obviously a big part of this scheme is tuning the exact numbers and getting the
sampling algorithm to work with the seed generator so that the output is both
high quality and contains enough variability for the watermarking to be visible
to the proper detector.


## It benefits companies providing the service. 

While it's true the EU has mandated this, I doubt that companies would implement
this so promptly if there wasn't an intrinsic economic benefit to the companies
providing AI services.

Since the core aim of generative AI is to mimic high quality human output it
follows that input data should only be human generated samples that is judged by
who ever is feeding the machine to be high quality.

Looking at the phrasing in the 2024 Nature paper it does seem like a major
economic driver is the desire to avoid "autophagy" where LLMs increasingly train
on other LLM output, leading to a strange kind of equilibrium.

It is not immediately obvious to me that this would be a worse outcome, but it
seems likely.

Another economic driver is probably the desire to detect when a model has been
stolen, or to keep an eye on how competitors are faring in the marketplace etc.

## What will circumventions look like?

The obvious thing will happen. There will be "cracks" which take in
text and either rerun it through multiple different AI generators or use yet
another, un-watermarked, specially built, LLM to rephrase the text.

The circumventions carry the risk of altering the meaning and quality of the
text and are extra work.


## Some wild speculation

When designer genes become common place, I wonder if there will be watermarks in
the form of both signatures in the DNA as well as signatures in the phenotype.

Perhaps when you ask for a child that is super talented in math (though with
recent AI developments, perhaps we will be asking for children who are very
talented in masonry or plumbing?) your child will have tiny microscopic
imperfections in his iris for the watermark, and your child could be evidence in
a legal case involving copyright violation?

Or, if we are to keep with the text watermarking method, your child proves
theorems in a certain way and uses certain variable names and words in their
proofs.

It's too easy to get sucked into a dystopian drain this way. Let us be
optimistic that we are able to enact legislation that keeps all this in check 
and we don't end up making a prophet out of Ridley Scott.


## References

[Junchao Wu, Shu Yang, Runzhe Zhan, Yulin Yuan, Lidia Sam Chao, Derek Fai Wong;
A Survey on LLM-Generated Text Detection: Necessity, Methods, and Future
Directions. Computational Linguistics 2025; 51 (1): 275–338.][wu2025] doi:
https://doi.org/10.1162/ 

[wu2025]: https://direct.mit.edu/coli/article/51/1/275/127462/A-Survey-on-LLM-Generated-Text-Detection-Necessity


[Dathathri, S., See, A., Ghaisas, S. et al. Scalable watermarking for identifying
large language model outputs. Nature 634, 818–823 (2024).
https://doi.org/10.1038/s41586-024-08025-4][dathathri2024]

[dathathri2024]: https://www.nature.com/articles/s41586-024-08025-4 


[Anthropic, How Claude’s text watermark works (Aug 14 2026)](anthropic2026)

[anthropic2026]: https://www.anthropic.com/news/claude-text-watermark


