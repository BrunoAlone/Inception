WP_DATA = /home/bruno/wordpress
DB_DATA = /home/bruno/mariadb
DOMAIN = brolivei.42.fr

all: up

up: build
		@sudo hostsed add 127.0.0.1 $(DOMAIN)
		@mkdir -p $(WP_DATA)
		@mkdir -p $(DB_DATA)
		docker compose -f ./srcs/docker-compose.yml up -d

down:
		docker compose -f ./srcs/docker-compose.yml down

stop:
		docker compose -f ./srcs/docker-compose.yml stop

start:
		docker compose -f ./srcs/docker-compose.yml start

build:
		docker compose -f ./srcs/docker-compose.yml build


clean:
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

