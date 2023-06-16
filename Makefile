
NGINX_DOC = srcs/requirements/nginx/
MARIA_DOC = srcs/requirements/mariadb/

all : nginx_img up
	docker images

nginx_img : $(NGINX_DOC)
	docker build -t nginx $(NGINX_DOC)

up :
	docker run -p 443:443 --env-file srcs/.env --name c_nginx -d nginx

down :
	docker stop c_nginx

clean :
	docker rm c_nginx

fclean : clean
	docker rmi nginx

re : fclean all