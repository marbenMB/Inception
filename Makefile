
ENV = srcs/.env
NGINX_DOC = srcs/requirements/nginx/
MARIA_DOC = srcs/requirements/mariadb/

all : mariadb_img up
	# docker images

nginx_img :
	docker build -t nginx $(NGINX_DOC)

mariadb_img :
	docker build -t mariadb $(MARIA_DOC)

up :
	# docker run -p 443:443 --env-file $(ENV) --name c_nginx -d nginx
	docker run --env-file $(ENV) --name c_mariadb -d mariadb

down :
	# docker stop c_nginx
	docker stop c_mariadb

clean :
	# docker rm c_nginx
	docker rm c_mariadb

fclean : clean
	# docker rmi nginx
	docker rmi mariadb

re : fclean all