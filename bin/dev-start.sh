#!/usr/bin/env sh

set +x pipefail

bundle check || bundle install
bundle exec rails db:create db:migrate
bundle exec foreman -f Procfile.dev start