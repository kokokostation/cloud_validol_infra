FROM apache/superset

COPY ./superset_config.py /app/pythonpath
RUN superset fab create-admin \
    --username admin \
    --firstname Alexander \
    --lastname Manakov \
    --email kokokostation@gmail.com \
    --password admin
RUN superset db upgrade
RUN superset init
