FROM debian:11

RUN apt-get update && apt-get upgrade -y

RUN apt-get clean

RUN apt-get install -y --no-install-recommends mariadb-server

RUN rm -rf /var/lib/apt/lists/*

COPY ./conf/mdb-conf.sh /mdb-conf.sh

RUN chmod +x /mdb-conf.sh

ENTRYPOINT ["/mdb-conf.sh"]
#CMD ["/mdb-conf.sh"]
# Dockerfile para criar imagem que irá correr a base de dados Mariadb.
