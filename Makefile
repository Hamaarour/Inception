GREEN := \033[1;32m
RED := \033[1;31m
LIGHT_GREEN := \033[1;92m
RESET := \033[0m

all: up


up:
	@echo "$(GREEN)Starting the containers...$(RESET)"
	@mkdir -p /home/hamaarou/data/wordpress
	@mkdir -p /home/hamaarou/data/mariadb
	docker-compose -f ./scrs/docker-compose.yml  up --build -d
	@echo "$(LIGHT_GREEN)Containers started successfully!$(RESET)"

down:
	@echo "$(RED)Stopping the containers...$(RESET)"
	docker-compose -f ./scrs/docker-compose.yml  down
	@echo "$(RED)Containers stopped successfully!$(RESET)"

stop:
	@echo "$(RED)Stopping the containers...$(RESET)"
	docker-compose -f ./scrs/docker-compose.yml  stop
	@echo "$(RED)Containers stopped successfully!$(RESET)"

start:
	@echo "$(GREEN)Starting the containers...$(RESET)"
	docker-compose -f ./scrs/docker-compose.yml  start
	@echo "$(LIGHT_GREEN)Containers started successfully!$(RESET)"

status:
	@docker ps

clean:
	@echo "$(RED)Cleaning the containers...$(RESET)"
	@docker-compose -f ./scrs/docker-compose.yml down
	@docker rmi -f `docker images -q`
	@docker volume rm `docker volume ls -q`
	@rm -rf /home/hamaarou/data/*
	@echo "$(RED)Containers cleaned successfully!$(RESET)"

fclean:clean
	@echo "$(RED)Removing all docker images...$(RESET)"
	sudo chmod -R 777 /home/hamaarou/data/wordpress/*
	sudo chmod -R 777 /home/hamaarou/data/mariadb/*
	sudo rm -rf wordpress mariadb
	@docker system prune -fa
	@echo "$(RED)All docker images removed!$(RESET)"



re: fclean all

.PHONY: all down re clean