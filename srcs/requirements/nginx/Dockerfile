FROM alpine:3.19

RUN apk update

RUN apk upgrade

RUN apk add nginx

RUN mkdir -p /etc/nginx/ssl

RUN apk add openssl

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt \
	-keyout /etc/nginx/ssl/inception.key \
	-subj "/C=PT/ST=Porto/L=Porto/O=42/OU=42/CN=brolivei.42.fr/UID=brolivei"

RUN mkdir -p /var/run/nginx

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

#RUN chmod 755 /var/www/html && chown -R www-data:www-data /var/www/html

#CMD ["nginx", "-g", "daemon off;"]


