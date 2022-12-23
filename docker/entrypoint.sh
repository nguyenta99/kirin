#!/bin/bash

ruby -v
bundle install -j3 --path /usr/local/bundle
exec "$@"
set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

bundle exec rails s -b 0.0.0.0