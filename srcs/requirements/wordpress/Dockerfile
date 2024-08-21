FROM debian:11

EXPOSE 9000

RUN apt-get update && apt-get upgrade

RUN apt-get clean

RUN apt-get install -y --no-install-recommends curl php php7.4-fpm php7.4-mysql mariadb-client netcat ca-certificates

RUN rm -rf /var/lib/apt/lists/*

COPY ./conf/wp_conf.sh /wp_conf.sh

RUN chmod +x wp_conf.sh

ENTRYPOINT ["./wp_conf.sh"]
