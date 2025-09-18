# Run the site locally with Podman

(From 
https://talk.jekyllrb.com/t/local-testing-of-existing-github-jekyll-site/7459/4)

```
# From the root directory
podman build --tag gh-pages .
podman run -it --rm --volume="$PWD:/srv/jekyll:Z" -w /srv/jekyll -p 4000:4000 gh-pages /bin/sh

# In the container
# bundle install may be needed before
bundle exec jekyll serve --livereload --host 0.0.0.0

# The site is live at http://localhost:4000
```
