GREEN := \033[1;32m
RED := \033[1;31m
LIGHT_GREEN := \033[1;92m
RESET := \033[0m

all: up


up:
	mkdir -p /home/hamaarou/data/wordpress
	mkdir -p /home/hamaarou/data/mariadb
	docker-compose -f ./scrs/docker-compose.yml  up --build -d

down:
	docker-compose -f ./scrs/docker-compose.yml  down

clean:
	@docker-compose -f ./scrs/docker-compose.yml down
	@docker rmi -f `docker images -q`
	@docker volume rm `docker volume ls -q`
	@rm -rf /home/hamaarou/data/*

fclean:clean


re: fclean all

.PHONY: all down re clean
