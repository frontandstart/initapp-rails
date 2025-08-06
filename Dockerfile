ARG RUBY_VERSION=3.4.5
FROM ruby:${RUBY_VERSION}-slim-bookworm AS development

RUN apt-get update -y && apt-get install -y \
      curl \
      graphviz \
      g++ \
      make \
      gcc \
      libpq-dev \
      libffi-dev \
      libyaml-dev \
      libxml2-dev \
      libxslt-dev \
      zlib1g-dev \
      xz-utils \
      imagemagick \
      libvips \
      git \
      libvips \
      watchman \
      bash

WORKDIR /app

ARG NODE_VERSION=22.14.0
ARG YARN_VERSION=1.22.22

RUN curl -sL https://github.com/nodenv/node-build/archive/master.tar.gz | tar xz -C /tmp/ && \
    /tmp/node-build-master/bin/node-build "${NODE_VERSION}" /usr/local/node 

ENV PATH=/usr/local/node/bin:$PATH

RUN npm install -g yarn@${YARN_VERSION} && \
    rm -rf /tmp/node-build-master

RUN gem install bundler foreman

FROM development AS builder

COPY Gemfile Gemfile.lock ./
RUN bundle config set production true
RUN bundle install --without development test \
                   --jobs $(nproc --all) \
                   --clean \
                   --deployment

COPY bun.lock package.json ./
RUN bundle install

FROM builder AS production

COPY . .

COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /usr/local/bundle /usr/local/bundle

RUN RAILS_ENV=production \
    SECRET_KEY_BASE=dummy \
    COMPILE=true \
    bundle exec rails assets:precompile
RUN rm -rf node_modules tmp/cache spec