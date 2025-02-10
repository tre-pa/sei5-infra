FROM postgres:14.13

COPY ./init-db.sh /docker-entrypoint-initdb.d/init-db.sh

RUN chmod +x /docker-entrypoint-initdb.d/init-db.sh

EXPOSE 5432

CMD ["postgres"]
