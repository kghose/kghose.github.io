---
title: Bash creature comforts
permalink: /linux-tips/bash
last_modified_at: 2025-09-28
---

# Command line completion from history

Add to `.inputrc` ([Stackoverflow](https://unix.stackexchange.com/a/20830))

```
# Key bindings, up/down arrow searches through history
"\e[A": history-search-backward
"\e[B": history-search-forward
"\eOA": history-search-backward
"\eOB": history-search-forward
```
