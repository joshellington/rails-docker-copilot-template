#!/bin/bash
set -e

# echo ""
# echo "== Waiting for any services =="
# ./bin/docker/entrypoints/wait-for-services.sh

echo ""
echo "== Preparing the database =="
# If database exists, migrate. Otherweise setup (create and seed)
./bin/bundle exec rails db:prepare && echo "Database is ready!"

echo ""
echo "== Clearing up any previous Rails Instances =="
rm -rf tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
echo ""
echo "== 🏎  Running: $@ =="
exec "$@"