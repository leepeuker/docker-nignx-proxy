up: network_up
	curl https://raw.githubusercontent.com/jwilder/nginx-proxy/master/nginx.tmpl > nginx.tmpl
	docker-compose up -d

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
