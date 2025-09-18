FROM docker.io/library/ruby:3.4.6-alpine3.21

RUN apk update
RUN apk add --no-cache build-base gcc cmake git

RUN gem update bundler && gem install bundler webrick github-pages


