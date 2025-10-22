---
title: "dnf: Fedora (Red Hat) package manager"
permalink: /linux-tips/dnf
last_modified_at: 2025-10-21
---

List all the repositories dnf searches through
```
dnf repolist --enabled
```

Remove a repository (has to be done "manually")
```
rm /etc/yum.repos.d/file_name.repo
```
