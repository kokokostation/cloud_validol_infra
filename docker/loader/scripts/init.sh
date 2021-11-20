set -e

mkdir -p /etc/cloud_validol
cat /app/scripts/secdist.json.tmpl | envsubst > /etc/cloud_validol/secdist.json

service cron start

tail -F /var/log/validol_scraper.log
