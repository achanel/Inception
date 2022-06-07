HOME=/home/achanel

all:	hosts build up

hosts:
	@sudo sed -i "s/localhost/achanel.42.fr/g" /etc/hosts

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

re:		fclean build up

fclean:	down
		@docker rmi -f $$(docker images -qa);\
		docker volume rm $$(docker volume ls -q);\
		docker system prune -a --force
		sudo rm -rf /home/${USER}/data/db
		sudo rm -rf /home/${USER}/data/www
		mkdir /home/${USER}/data/db
		mkdir /home/${USER}/data/www

logs:
	docker-compose -f ./srcs/docker-compose.yml logs
