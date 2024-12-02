#!/bin/bash
set -e

export PGPASSWORD="postgres"

docker compose build
docker compose up -d postgres

until pg_isready -h localhost -p 5433 -U postgres; do
  >&2 echo "Postgres is unavailable - waiting..."
  sleep 2
done

>&2 echo "Postgres is up - executing command"

#initialized to start web app as our database ir already up
docker compose up -d web

until curl -s http://localhost:5123/actuator/health | grep '"status":"UP"' > /dev/null; do
  >&2 echo "Spring Boot app at http://localhost:5123 is unavailable - waiting..."
  sleep 2
done
echo "Spring Boot app is up - continuing..."

# Check if the table 'sector' is already populated
if psql -h localhost -p 5433 -U postgres -d company -c "SELECT 1 FROM sector LIMIT 1;" | grep -q 1; then
  >&2 echo "Table 'sector' is already populated."
else
  >&2 echo "Table 'sector' is not populated. Running: populate_sectors.sql"
  # Execute the SQL script
  psql -h localhost -p 5433 -U postgres -d company -f ./scripts/populate_sectors.sql  -q
fi

echo "----------------------------------------"
echo ""
echo "App running, visit http://localhost:5123"
echo ""
echo "----------------------------------------"