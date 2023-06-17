SET @dbname = '$M_DB_NAME';
CREATE DATABASE IF NOT EXISTS '@dbname';

SET @user = '$M_USER_NAME';
SET @pass = '$M_USER_PASS';
CREATE USER '@user'@'%' IDENTIFIED BY '@pass';
GRANT ALL PRIVILIGES ON '@dbname'.* TO '@user'@'%';
FLUSH PRIVILIGES;