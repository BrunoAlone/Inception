FROM debian:11

RUN apt-get update

RUN apt-get upgrade

RUN apt-get clean

# Install nginx
RUN apt-get install -y --no-install-recommends nginx openssl

# Install openssl
#RUN apt-get install -y --no-install-recommends openssl

RUN apt-get clean

# Create directory to ssl
# -p flag ensures that no error is desplay if the directory already exists.
# That ensures that the creation does not stop.
RUN mkdir -p /etc/nginx/ssl

# Create ssl certificate
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt \
	-keyout /etc/nginx/ssl/inception.key \
	-subj "/C=PT/ST=Porto/L=Porto/O=42/OU=42/CN=brolivei.42.fr/UID=brolivei"

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# Creating directory to webfiles
RUN mkdir -p /var/www/wordpress

RUN chmod 755 /var/www/wordpress

RUN chown -R www-data:www-data /var/www/wordpress

CMD ["nginx", "-g", "daemon off;"]
