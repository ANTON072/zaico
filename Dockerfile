FROM ruby:3.1.3

ENV LANG C.UTF-8
ENV TZ Asia/Tokyo

RUN set -ex && \
    apt-get update -qq && \
    apt-get install -y --no-install-recommends sudo && \
    apt-get install -y --no-install-recommends postgresql-client && \
    : "Cleaning..." && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /myapp

COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

RUN bundle install