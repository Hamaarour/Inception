GREEN := \033[1;32m
RED := \033[1;31m
LIGHT_GREEN := \033[1;92m
RESET := \033[0m

all:
	@echo "$(GREEN)Starting the containers...$(RESET)"
	@docker-compose -f ./scrs/docker-compose.yml up -d --build
	@echo "$(LIGHT_GREEN)Containers started successfully!$(RESET)"

down:
	@echo "$(RED)Stopping the containers...$(RESET)"
	@docker-compose -f ./scrs/docker-compose.yml down
	@echo "$(RED)Containers stopped successfully!$(RESET)"

re:
	@echo "$(GREEN)Rebuilding and starting the containers...$(RESET)"
	@docker-compose -f ./scrs/docker-compose.yml up -d --build
	@echo "$(LIGHT_GREEN)Containers started successfully!$(RESET)"

clean:
	@echo "$(RED)Cleaning the containers...$(RESET)"
	@docker-compose -f ./scrs/docker-compose.yml down --volumes --rmi all
	@echo "$(RED)Containers cleaned successfully!$(RESET)"

.PHONY: all down re clean
