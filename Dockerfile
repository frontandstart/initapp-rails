ARG RUBY_VERSION=3.4.2
FROM ruby:${RUBY_VERSION}-slim-bullseye AS development

COPY --from=node:20.16.0-bullseye-slim /usr/local/bin/node /usr/local/bin/
COPY --from=node:20.16.0-bullseye-slim /usr/local/lib/node_modules /usr/local/lib/node_modules
COPY --from=node:20.16.0-bullseye-slim /opt/yarn-v1.22.22 /opt/yarn-v1.22.22

RUN ln -s /usr/local/bin/node /usr/local/bin/nodejs && \
    ln -s /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm && \
    ln -s /usr/local/lib/node_modules/npm/bin/npx-cli.js /usr/local/bin/npx && \
    ln -s /usr/local/lib/node_modules/corepack/dist/corepack.js /usr/local/bin/corepack && \
    ln -s /opt/yarn-v1.22.22/bin/yarn /usr/local/bin/yarn && \
    ln -s /opt/yarn-v1.22.22/bin/yarnpkg /usr/local/bin/yarnpkg

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
      libvips \
      git \
      libvips \
      bash

WORKDIR /app

ENV BUNDLE_JOBS=$(nproc)

FROM development AS production

ENV BUNDLE_JOBS=$(nproc)

COPY . .

RUN bundle config set production true
RUN bundle install
RUN bundle exec rails assets:precompile