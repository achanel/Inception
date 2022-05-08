HOME=/home/achanel

all:
        hosts rmvolumes volumes build up

hosts:
        @sudo sed -i "localhost" /etc/hosts

rmvolumes:
        sudo rm-rf $(HOME)/data

volumes:
        mkdir -p $(HOME)/data
        mkdir -p $(HOME)/data/db
        mkdir -p $(HOME)/data/www

build:
        docker-compose -f ./srcs/docker-compose.yml build

up:
        @docer-compose -f ./srcs/docker-compose.yml up -d

down:
        docer-compose -f ./srcs/docker-compose.yml down

start:
        docer-compose -f ./srcs/docker-compose.yml start

stop:
        docer-compose -f ./srcs/docker-compose.yml stop

re:
        down rmvolumes build up

logs:
        docer-compose -f ./srcs/docker-compose.yml logs