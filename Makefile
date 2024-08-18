all:	build up

build:
	docker-compose -f srcs/docker-compose.yml build

up:
	docker-compose -f srcs/docker-compose.yml up -d

down:
	docker-compose -f srcs/docker-compose.yml down

clean: down
	docker system prune -a --volumes

fclean: clean
	sudo rm -rf /home/yoamzil/data/wordpress/*
	sudo rm -rf /home/yoamzil/data/mariadb/*
	docker volume rm srcs_wordpress
	docker volume rm srcs_mariadb

re: clean all
