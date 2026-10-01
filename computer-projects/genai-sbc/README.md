---
layout: page
title: The transparent (AI) brain project 
permalink: /genai-expt/
last_modified_at: 20-07-2026
---

I aim to build a little box that runs a small(ish) LLM that does some kind of
continuous video/audio processing and has a bunch of knobs (real or virtual)
that will let you peer into the neurons and watch them work as the AI works.

The watching should be educational i.e. it shouldn't be all blinken lights: We
should gain some insight by matching up the input and output of the brain with
the visualization of its processing. 

Bonus: There are knobs (real or virtual) that allow us to mess around with the
AI brain, and change what it does.


<ol>
  {% for p in site.pages %}
    {% if p.dir == "/genai-expt/" and p.name != "README.md" %}
      <li><a href="{{ p.url | relative_url }}">{{ p.title }} ({{ p.last_modified_at }})</a></li>
    {% endif %}
  {% endfor %}
</ol>

