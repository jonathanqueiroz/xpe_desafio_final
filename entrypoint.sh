#!/bin/bash
set -e

# Wait for PostgreSQL to be ready
until PGPASSWORD=$DB_PASSWORD psql -h "$DB_HOST" -U "$DB_USERNAME" -c '\q'; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done

>&2 echo "Postgres is up - executing command"

# If database exists, migrate. Otherwise setup (create and migrate)
bundle exec rails db:migrate 2>/dev/null || bundle exec rails db:setup

# Then exec the container's main process (what's set as CMD in the Dockerfile)
exec "$@"
