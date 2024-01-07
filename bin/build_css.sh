#!/bin/bash

set -exuo pipefail

command=${1:-""}

sass ./app/assets/stylesheets/application.scss:./app/assets/builds/application.css \
     --no-source-map --load-path=node_modules $command