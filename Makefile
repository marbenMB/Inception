FILE=./srcs/docker-compose.yml
GREE=\x1b[32m
BLU=\x1b[34m
RED=\x1b[31m
CLO=\033[0m

up:
	@echo "$(BLU)"
	@echo "// ************** //"
	@echo "     STARTING       "
	@echo "// ************** //"
	@echo "$(CLO)"
	# @mkdir -p /home/mbenbajj/data &> /dev/null
	# @mkdir -p /home/mbenbajj/data/wordpress &> /dev/null
	# @mkdir -p /home/mbenbajj/data/mariadb &> /dev/null
	@docker-compose -f $(FILE) up -d

build:
	@echo "$(GREE)"
	@echo "// ************** //"
	@echo "      BUILDING      "
	@echo "// ************** //"
	@echo "$(CLO)"
	@docker-compose -f $(FILE) build

start:
	@docker-compose -f $(FILE) start

stop:
	@docker-compose -f $(FILE) stop

down:
	@docker-compose -f $(FILE) down

clean:
	@docker-compose -f $(FILE) down -v

msg:
	@echo "$(RED)"
	@echo "// ************** //"
	@echo "     SHUTDOWN       "
	@echo "     CLEANING       "
	@echo "// ************** //"
	@echo "$(CLO)"

fclean: msg down clean 
	@docker rmi nginx:mbenbajj
	@docker rmi mariadb:mbenbajj
	@docker rmi wordpress:mbenbajj
	@docker rmi redis:mbenbajj
	@docker rmi adminer:mbenbajj
	@docker rmi static:mbenbajj
	@docker rmi cadvisor:mbenbajj

prune:
	@docker system prune -af
	@rm -rf /home/mbenbajj/data/* &> /dev/null

re : fclean build up

.PHONY : up build start stop down clean fclean re