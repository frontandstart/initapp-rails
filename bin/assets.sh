#!/bin/bash

action="$1"

case "$action" in
  css)
    sass ./app/assets/stylesheets/application.scss:./app/assets/builds/application.css --watch --no-source-map --load-path=node_modules
    ;;
  js)
    esbuild app/assets/javascript/*.* --bundle --sourcemap --outdir=app/assets/builds --public-path=assets --watch
    ;;
  *)
    echo "Invalid action. Please specify either 'decrypt' or 'encrypt'."
    exit 1
    ;;
esac

