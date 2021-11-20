FROM apache/superset

RUN pip install psycopg2==2.8.6 and psycopg2-binary==2.8.6
RUN superset fab create-admin \
    --username admin \
    --firstname Alexander \
    --lastname Manakov \
    --email kokokostation@gmail.com \
    --password admin
RUN superset db upgrade
RUN superset load_examples
RUN superset init
