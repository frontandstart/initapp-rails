#!/bin/bash

sass ./app/assets/stylesheets/rails_admin.scss:./app/assets/builds/rails_admin.css \
     ./app/assets/stylesheets/application.css:./app/assets/builds/application.css \         
     --watch --no-source-map --load-path=node_modules