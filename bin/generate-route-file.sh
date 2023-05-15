#!/usr/bin/env sh
rm -rf ./routes.txt
rails routes >> ./routes.txt 2>&1