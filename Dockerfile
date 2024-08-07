FROM ruby:3.2.5-slim-bullseye AS development

COPY --from=node:20.16.0-bullseye-slim /usr/local/bin/node /usr/local/bin/
COPY --from=node:20.16.0-bullseye-slim /usr/local/lib/node_modules /usr/local/lib/node_modules
COPY --from=node:20.16.0-bullseye-slim /opt/yarn-v1.22.22 /opt/yarn-v1.22.22

RUN ln -s /usr/local/bin/node /usr/local/bin/nodejs
RUN ln -s /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm
RUN ln -s /usr/local/lib/node_modules/npm/bin/npx-cli.js /usr/local/bin/npx
RUN ln -s /usr/local/lib/node_modules/corepack/dist/corepack.js /usr/local/bin/corepack
RUN ln -s /opt/yarn-v1.22.22/bin/yarn /usr/local/bin/yarn
RUN ln -s /opt/yarn-v1.22.22/bin/yarnpkg /usr/local/bin/yarnpkg

ENV BUNDLE_JOBS=$(nproc)
ENV BUNDLE_RETRY=2

RUN apt-get update -y && apt-get install -y \
      curl \
      graphviz \
      g++ \
      make \
      gcc \
      libffi-dev \
      libyaml-dev \
      python3 \
      libpq-dev \
      git \
      imagemagick \
      libvips \
      bash

WORKDIR /app

RUN gem install bundler

FROM development AS production

RUN bundle config --global jobs $(nproc --all)

COPY . .

RUN bundle config set production true
RUN bundle install
RUN bundle exec rails assets:precompile