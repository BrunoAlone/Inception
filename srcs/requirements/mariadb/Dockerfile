FROM alpine:3.19

RUN apk update

RUN apk upgrade

# openrc is to start processes in alpine
RUN apk add openrc

# mariadb package -> Contains the MariaDB server
# mariadb-client -> Contains tools to interect with the MariaDB server
# like 'mysql' command.
RUN apk add --no-cache mariadb mariadb-client

RUN openrc

RUN touch /run/openrc/softlevel

COPY ./conf/mdb-conf.sh /mdb-conf.sh

RUN chmod +x /mdb-conf.sh

ENTRYPOINT ["./mdb-conf.sh"]

# Dockerfile para criar imagem que irá correr a base de dados Mariadb.
