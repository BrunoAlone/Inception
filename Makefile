WP_DATA = /home/data/wordpress
DB_DATA = /home/data/mariadb

all: up

up: build
		@mkdir -p $(WP_DATA)
		@mkdir -p $(DB_DATA)
		sudo docker-compose -f ./srcs/docker-compose.yml up -d

down:
		sudo docker-compose -f ./srcs/docker-compose.yml down

stop:
		sudo docker-compose -f ./srcs/docker-compose.yml stop

start:
		sudo docker-compose -f ./srcs/docker-compose.yml start

build:
		sudo docker-compose -f ./srcs/docker-compose.yml build


clean:
		@sudo docker stop $$(docker ps -qa) || true
		@sudo docker rm $$(docker ps -qa) || true
		@sudo docker rmi -f $$(docker images -qa) || true
		@sudo docker volume rm $$(docker volume ls -q) || true
		@sudo docker network rm $$(docker network ls -q) || true
		@rm -rf $(WP_DATA) || true
		@rm -rf $(DB_DATA) || true

re: clean up

prune: clean
			@sudo docker system prune -a --volumes -f

