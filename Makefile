include .env

# Container management
######################
up: network_up
	docker-compose up -d
	docker start webproxy-dockergen

down:
	docker-compose down
	make network_down

reup: down up

rebuild: down
	docker-compose build

network_up:
	docker network create webproxy || true

network_down:
	docker network remove webproxy || true


# Container interaction
#######################
connect_mysql_cli:
	docker exec -it webproxy-mysql bash -c "mysql -uroot -p${MYSQL_ROOT_PASSWORD}"

logs_nginx:
	docker logs -f webproxy-nginx

logs_dockergen:
	docker logs -f webproxy-dockergen

logs_letsencyrpt:
	docker logs -f webproxy-letsencrypt

logs_mysql:
	docker logs -f webproxy-mysql