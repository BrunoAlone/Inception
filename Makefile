WP_DATA = /home/bruno/wordpress
DB_DATA = /home/bruno/mariadb
DOMAIN = brolivei.42.fr

all: up

up: build
#		Manipulating the file /etc/hosts, so the brolivei.42.fr is resolved
#	like the local IP address.
		@sudo hostsed add 127.0.0.1 $(DOMAIN)
		@mkdir -p $(WP_DATA)
		@mkdir -p $(DB_DATA)
		docker compose -f ./srcs/docker-compose.yml up -d

test_TLSv:
		@echo "Testing trying to connect with TLSv1.1"
		openssl s_client -connect brolivei.42.fr:443 -tls1_1

down:
		docker compose -f ./srcs/docker-compose.yml down

stop:
		docker compose -f ./srcs/docker-compose.yml stop

start:
		docker compose -f ./srcs/docker-compose.yml start

build:
		docker compose -f ./srcs/docker-compose.yml build

clean:	stop
		docker rm $$(docker ps -qa) || true
		docker rmi -f $$(docker images -qa) || true

fclean:	stop
		docker stop $$(docker ps -qa) || true
		docker rm $$(docker ps -qa) || true
		docker rmi -f $$(docker images -qa) || true
		docker volume rm $$(docker volume ls -q) || true
		docker network rm $$(docker network ls -q) || true
		sudo rm -rf $(WP_DATA) || true
		sudo rm -rf $(DB_DATA) || true
		@sudo hostsed rm 127.0.0.1 $(DOMAIN)

re: clean up

prune: clean
			@sudo docker system prune -a --volumes -f

