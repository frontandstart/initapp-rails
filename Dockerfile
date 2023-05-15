FROM ruby:3.2.0-alpine3.17 as development

COPY --from=node:20-alpine3.17 /usr/local/bin/node /usr/local/bin/
COPY --from=node:20-alpine3.17 /opt/yarn-v1.22.19 /opt/yarn-v1.22.19

RUN ln -s /usr/local/bin/node /usr/local/bin/nodejs
RUN ln -s /opt/yarn-v1.22.19/bin/yarn /usr/local/bin/yarn
RUN ln -s /opt/yarn-v1.22.19/bin/yarnpkg /usr/local/bin/yarnpkg

RUN apk update && \
    apk add --no-cache \
      git \
      tzdata \
      graphviz \
      font-noto \
      postgresql-dev \
      make \
      g++ \
      icu-data-full \
      bash

WORKDIR /app

RUN gem install bundler

FROM development as production

RUN bundle config --global jobs $(nproc --all)

COPY . .

RUN bundle config set production true
RUN bundle install
RUN bundle exec rails assets:precompile