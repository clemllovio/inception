all:	up

up:
	mkdir -p ${HOME}/data
	mkdir -p ${HOME}/data/wordpress
	mkdir -p ${HOME}/data/mariadb
	sudo sh -c 'echo "127.0.0.1 cllovio.42.fr" >> /etc/hosts && echo "Successfully added cllovio.42.fr to /etc/hosts"'
	docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	docker compose -f ./srcs/docker-compose.yml down

clean:
	docker stop nginx wordpress mariadb 2>/dev/null || true
	docker rm nginx wordpress mariadb 2>/dev/null || true
	docker volume rm mariadb_data wordpress_data 2>/dev/null || true
	docker rmi srcs-nginx srcs-wordpress srcs-mariadb 2>/dev/null || true
	docker network rm inception_net 2>/dev/null || true
	sudo rm -rf ${HOME}/data
	sudo sed -i '/127.0.0.1 cllovio.42.fr/d' /etc/hosts && echo "cllovio.42.fr removed in /etc/hosts"

purge:	down clean
	docker system prune --all

re: clean all

.PHONY: all up down build clean purge re