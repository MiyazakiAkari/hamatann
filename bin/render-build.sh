#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
yarn install
bundle exec rails db:migrate