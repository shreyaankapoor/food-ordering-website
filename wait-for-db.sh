#!/bin/sh
# wait-for-db.sh

echo "⏳ Waiting for MySQL at $DB_HOST:$DB_PORT..."

until nc -z "$DB_HOST" "${DB_PORT:-3306}"; do
  sleep 1
done

echo "✅ MySQL is up - starting the app"

exec "$@"
