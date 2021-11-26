set -e

CONN="dbname=$DATABASE_DB host=$DATABASE_HOST user=$DATABASE_USER password=$DATABASE_PASSWORD"

until psql "$CONN" -c '\q'; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done

>&2 echo "Postgres is up - executing command"

CLOUD_VALIDOL_ROOT=$(python3 -c "import importlib_resources; print(str(importlib_resources.files('cloud_validol')));")
pgmigrate -t latest -d "$CLOUD_VALIDOL_ROOT/postgresql/pgmigrate" -c "$CONN" migrate
