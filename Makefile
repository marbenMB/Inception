
ENV = srcs/.env
NGINX_DOC = srcs/requirements/nginx/
MARIA_DOC = srcs/requirements/mariadb/
WORD_DOC = srcs/requirements/wordpress/
NET = inception

all : net nginx_img mariadb_img wordpress_img up
	# docker images

net :
	docker network create -d bridge $(NET)

nginx_img :
	docker build -t nginx $(NGINX_DOC)

mariadb_img :
	docker build -t mariadb $(MARIA_DOC)

wordpress_img :
	docker build -t wordpress $(WORD_DOC)

up :
	docker run --env-file $(ENV) -v mariaVol:/var/lib/mysql --network $(NET) --name c_mariadb -d mariadb
	docker run --env-file $(ENV) -v wordVol:/var/www/html --network $(NET) --name c_wordpress -d wordpress
	docker run -p 443:443 --env-file $(ENV) -v wordVol:/var/www/html --network $(NET) --name c_nginx -d nginx

down :
	docker stop c_nginx
	docker stop c_mariadb
	docker stop c_wordpress

clean :
	docker rm c_nginx
	docker rm c_mariadb
	docker rm c_wordpress

fclean : down clean 
	docker rmi nginx
	docker rmi mariadb
	docker rmi wordpress
	docker network rm $(NET)
	docker volume rm mariaVol
	docker volume rm wordVol

re : fclean all