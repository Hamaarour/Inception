path = ./scrs/docker-compose.yml

GREEN := \033[1;32m
RED := \033[1;31m
LIGHT_GREEN := \033[1;92m
RESET := \033[0m

# Makefile


all:
	@echo "$(GREEN)Starting the containers...$(RESET)"
	@docker compose -f ./scrs/docker-compose.yml up -d --build
	@echo "$(LIGHT_GREEN)Containers started successfully!$(RESET)"

down:
	@echo "$(RED)Stopping the containers...$(RESET)"
	@docker compose -f ./scrs/docker-compose.yml down
	@echo "$(RED)Containers stopped successfully!$(RESET)"
re:
	@echo "$(RED)Stopping the containers...$(RESET)"
	@docker compose -f scrs/docker-compose.yml up -d --build
	@echo "$(LIGHT_GREEN)Containers started successfully!$(RESET)"

clean:
	@echo "$(RED)Cleaning the containers...$(RESET)"
	@docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	docker network rm $$(docker network ls -q);\
	@echo "$(RED)Containers cleaned successfully!$(RESET)"

.PHONY: all down re clean

