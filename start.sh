#!/usr/bin/env bash
set -xe

sequel --version
# sequel -E -m migrations/ mock://postgres
# sequel -E -m migrations/ mock://sqlite

# sequel -E -m db/migrations/ sqlite://db/production.sqlite

# dump schema:
# sequel -d sqlite://db/db.sqlite

ruby app.rb
