FROM debian:11

#EXPOSE 3306

RUN apt-get update

RUN apt-get upgrade

RUN apt-get clean

RUN apt-get install -y --no-install-recommends -o Dir::Cache::archives="none" mariadb-server

RUN apt-get clean

RUN rm -rf /var/lib/apt/lists/*

COPY ./conf/mdb-conf.sh /mdb-conf.sh

RUN chmod +x /mdb-conf.sh

ENTRYPOINT ["./mdb-conf.sh"]
# Dockerfile para criar imagem que irá correr a base de dados Mariadb.
