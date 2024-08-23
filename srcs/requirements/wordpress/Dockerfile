FROM debian:11

EXPOSE 9000

RUN apt-get update && apt-get upgrade

RUN apt-get clean

RUN apt-get install -y --no-install-recommends curl \
	php php7.4-fpm php7.4-mysql \
	mariadb-client netcat ca-certificates

# Installing specifically the version 7.4 we can ensure that all works
#with that versions. We install "php" to ensure that the base packages are
#installed.

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN rm -rf /var/lib/apt/lists/*

COPY ./conf/wp_conf.sh /wp_conf.sh

RUN chmod +x wp_conf.sh

ENTRYPOINT ["./wp_conf.sh"]
