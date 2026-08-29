---
title: "The marvelous bee odometer"
layout: post
permalink: /articles/bee-odometer 
date: 2017-07-27
categories: 
  - "best-of"
  - "genomics-and-biology"
tags: 
  - "animal-behavior"
  - "biomimetic"
  - "sociology"
---

You probably know that not only can bees compute the vector (direction and distance) to a discovered food source relative to their hive, but they can also convey this vector to their hive mates. Here, I'll talk a little bit about one component of this system - the Bee odometer: how do bees figure out the distance to the food.

Bees are amazing. In general, insects are amazing. If you are into robotics of any kind, you should definitely be studying the insect literature. Bees can not only perform vector summation to compute the bee-line from their hive to a source of food they have discovered, but they can convey this vector to their hive mates via a form of sign-language!

Bees use a [dance](https://en.wikipedia.org/wiki/Waggle_dance) to instruct hivemates as to the direction and distance of a food source. They make circular and figure eight movements on the vertical surface of the hive. They waggle during the dance and the intensity of the waggling conveys the distance. The orientation of the axis of the dance conveys direction)

How they compute the direction is just as marvelous as to how they compute the distance, but I will just talk about distance here. There are two competing hypotheses as to how they keep track of how far they have flown. One is that they track how much energy they have consumed while flying to the food, which correlates with the distance. This hypothesis has a nice ecological feel to it because energy (food) is the main reason they are flying out in the first place, and we can imagine that there are decisions to be made based on how much energy it takes to get to a food source.

The competing hypothesis is that bees use optic flow - the percept of visual motion from their environment - to determine how far they've flown. This hypothesis is way cool.

Like in most such scientific debates, a small cottage industry grew around this question, sustaining several scientific families for most of their adult lives. The basic method for the experiments researchers did was to have bees fly from their hive to a food source and then watch their dances when they got back to the hive. The dances tell us what the bee THOUGHT the distance to the food was, and of course, we can measure the actual distance ourselves and compare. Then various tricks are played on the bees to try and figure out what cues they are using to determine flight distance.

The review by Esch and Burns \[1\] makes interesting reading in the context of the sociology and politics of science. One experiment supporting the energy hypothesis was done by a fella named Heran. He had bees forage going either uphill or downhill from a hive to a feeder placed at a constant distance. The energy hypothesis predicts that bees going uphill will measure a longer distance than bees flying downhill (even though the actual distance was the same). Apparently out of seven runs of the experiment with this setup, Heran found five that showed the bees didn't care if they were going uphill or downhill - they just flagged a fixed distance. In just two runs Heran found an answer supporting the energy hypothesis. He explained away the other five results by blaming winds and reported that bees use energy (!)

A scientist called von Frisch was a pioneer in the study of the natural behavior of bees (among other insects). According to Each and Burns \[1\] in one study von Frisch actually had evidence for an optic flow hypothesis. von Frisch observed that bees flying over water to get to a feeder would signal shorter distances than bees flying over land to get to a feeder at the same distance. The smooth reflective surface of the water offers far less by way of optic flow (image motion) that say a grassy knoll dotted with trees and cows and buttercups. When a bee flies over the water, it's basically this dark blue featureless sheet which tricks it into thinking it's not really flying far.

In fact, bees are known to dive low - sometimes too low, ending up drowning - because they can't sense any motion from the water, and it turns out from later experiments, this sense of motion from the ground is essential to them, and they use it to adjust how far they fly from objects.

But here comes the kicker. He had another set of similar experiments done on a windy day, when the wind happened to blow against the bees flying over the lake and with the bees flying over land. Now this time the bees flying over the lake signaled a longer distance. Was this because they had to work harder or because there was a ton of optic flow from the ripples on the lake that made it look like they were flying a lot? It's a confound.

The proper action would have been to repeat the experiment on a windless day - like the previous experiment - to avoid this confounding variable, but von Frisch averaged the two results together and found that bees don't care if they were flying over land or water - they always correctly estimated the distance.

Obviously von Frisch liked the energy hypothesis. And von Frisch was a big cheese. So the energy hypothesis came into favor. But as always the truth will out and people kept investigating and finding things that didn't quite jive with the energy hypothesis.

Finally, there was a series of elegant experiments that strongly supported the optic flow hypothesis. Scientists placed relatively short tubes at the mouths of feeders. The tubes had different kinds of textures on them, some designed to elicit a lot of optic flow (i.e. very dense textures) while others were almost featureless (generating very little optic flow). When bees had to get to the feeder by passing though highly textured tubes they reported much longer distances than when they flew through sparsely textured tubes \[2, 3\]. The researchers also did a bunch of fun quantitative analyses to estimate how the bee converted the optic flow it is probably sensing to the distance it thinks it flew.

Now, like in most biological systems, it is unlikely the honey bee is using just this one cue - it's probably a combination of cues that gives the honey bee it's final percept of distance, but the experiments suggest that vision, and optic flow specifically are the most heavily used cues by bees to determine how far they've flown, as well as to adjust things like how high they fly above a surface and how much distance they will keep from obstacles.

References

1. [Distance estimation by foraging honeybees.](https://www.ncbi.nlm.nih.gov/pubmed/9317542) Esch H, Burns J. Journal of Experimental Biology 1996 199: 155-162.
2. [Honeybee dances communicate distances measured by optic flow.](https://www.ncbi.nlm.nih.gov/pubmed/11385571) Esch HE, Zhang S, Srinivasan MV, Tautz J. Nature. 2001 May 31;411(6837):581-3.
3. [Honeybee navigation: nature and calibration of the "odometer"](https://www.ncbi.nlm.nih.gov/pubmed/10657298). Srinivasan MV, Zhang S, Altwein M, Tautz J. Science. 2000 Feb 4;287(5454):851-3.
