# Run the site locally with Podman

(Adapted from 
https://talk.jekyllrb.com/t/local-testing-of-existing-github-jekyll-site/7459/4)

1. If you need to build the image, from the project root directory run `podman 
   build --tag gh-pages .`
1. `bundle install` needed for first run:
   `podman run -it --rm --volume="$PWD:/srv/jekyll:Z" -w /srv/jekyll -p 4000:4000 gh-pages /bin/sh -c "bundle install"`
1. `podman run -it --rm --volume="$PWD:/srv/jekyll:Z" -w /srv/jekyll -p 4000:4000 gh-pages /bin/sh -c "bundle exec jekyll serve --livereload --host 0.0.0.0"`

The site is live at http://localhost:4000
