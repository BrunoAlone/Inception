FROM debian:11

RUN apt-get update

RUN apt-get upgrade

RUN apt-get clean

RUN apt-get install -y curl php php7.4-fpm php-mysql mariadb-client netcat

COPY ./conf/wp_conf.sh /

RUN chmod +x wp_conf.sh

ENTRYPOINT ["./wp_conf.sh"]
