HOME=/home/achanel

all:	volumes build up

rmvolumes:
		sudo rm -rf $(HOME)/data

volumes:
		mkdir -p $(HOME)/data
		mkdir -p $(HOME)/data/db
		mkdir -p $(HOME)/data/www

build:
		docker-compose -f ./srcs/docker-compose.yml build

up:
		@docker-compose -f ./srcs/docker-compose.yml up -d

down:
		docker-compose -f ./srcs/docker-compose.yml down

start:
		docker-compose -f ./srcs/docker-compose.yml start

stop:
		docker-compose -f ./srcs/docker-compose.yml stop

re:		down rmvolumes volumes build up

logs:
	docker-compose -f ./srcs/docker-compose.yml logs