all:	up

up:
	mkdir -p /home/cllovio/data
	mkdir -p /home/cllovio/data/wordpress
	mkdir -p /home/cllovio/data/mariadb
	sudo sh -c 'echo "127.0.0.1 cllovio.42.fr" >> /etc/hosts && echo "Successfully added cllovio.42.fr to /etc/hosts"'
	docker compose -f ./srcs/docker-compose.yml up --build

down:
	docker compose -f ./srcs/docker-compose.yml down

clean:
	sudo rm -rf /home/cllovio/data
	sudo docker compose -f ./srcs/docker-compose.yml down --volumes --rmi all
	sudo sed -i '/127.0.0.1 cllovio.42.fr/d' /etc/hosts && echo "cllovio.42.fr removed in /etc/hosts"

prune:	down clean
	docker system prune --all --volumes

re: clean all

.PHONY: all up down clean prune re