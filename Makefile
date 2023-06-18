
ENV = srcs/.env
NGINX_DOC = srcs/requirements/nginx/
MARIA_DOC = srcs/requirements/mariadb/
WORD_DOC = srcs/requirements/wordpress/

all : wordpress_img up
	# docker images

nginx_img :
	docker build -t nginx $(NGINX_DOC)

mariadb_img :
	docker build -t mariadb $(MARIA_DOC)

wordpress_img :
	docker build -t wordpress $(WORD_DOC)

up :
	# docker run -p 443:443 --env-file $(ENV) --name c_nginx -d nginx
	# docker run --env-file $(ENV) --name c_mariadb -d mariadb
	docker run --env-file $(ENV) -v /Users/marouanebenbajja/Desktop/Inception/volumes/wordpress:/mount --name c_wordpress -d wordpress

down :
	# docker stop c_nginx
	# docker stop c_mariadb
	docker stop c_wordpress

clean :
	# docker rm c_nginx
	# docker rm c_mariadb
	docker rm c_wordpress

fclean : clean
	# docker rmi nginx
	# docker rmi mariadb
	docker rmi wordpress
	rm -rf /volumes/mariadb/*
	rm -rf /volumes/wordpress/*

re : fclean all