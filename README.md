# Guideline for install and run rabbitmq

# Guideline for install and run mysql 5

run docker vs mysql version 5.7

docker run --name mysql -e MYSQL_ROOT_PASSWORD=Welcome1 -p 3306:3306 -d mysql:5.7 --sql-mode='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' --default-authentication-plugin=mysql_native_password



