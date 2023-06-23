PATH=./srcs/docker-compose.yml
GREE=\x1b[32m
CLO=\033[0m

up :
	@docker compose -f $(PATH) up -d --build

build :
	@echo "$(GREE)"
	@echo "// ************** //"
	@echo "      Building      "
	@echo "// ************** //"
	@echo "$(CLO)"
	@docker compose -f $(PATH) build

start :
	docker compose -f $(PATH) start

stop :
	docker compose -f $(PATH) stop

down :
	docker compose -f $(PATH) down

clean :
	docker compose -f $(PATH) down -v

fclean : down clean 
	docker rmi nginx
	docker rmi mariadb
	docker rmi wordpress

re : fclean build up

.PHONY : up build start stop down clean fclean re