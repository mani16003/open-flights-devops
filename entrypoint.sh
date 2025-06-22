#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /app/tmp/pids/server.pid

# Run migrations
bundle exec rake db:migrate 2>/dev/null || true

# Then exec the container’s main process (what’s set in CMD)
exec "$@"
