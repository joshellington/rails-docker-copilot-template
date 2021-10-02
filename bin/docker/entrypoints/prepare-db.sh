#!/bin/bash
set -e

# If database exists, migrate. Otherweise setup (create and seed)
./bin/bundle exec rails db:prepare && echo "Database is ready!"