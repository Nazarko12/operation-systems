/etc/init.d/mysql start

cd
git clone -b docker-one-container https://github.com/Nazarko12/examination-task.git
cd examination-task/
mvn install
mvn clean package
timeout 30s mvn spring-boot:run

export MYSQL_PWD=password
/usr/bin/mysql -u root -e "CREATE DATABASE IF NOT EXISTS laboratorna5;"
/usr/bin/mysql -u root -e "FLUSH PRIVILEGES;"
/usr/bin/mysql -u root laboratorna5 < src/main/resources/lab4.sql
mvn spring-boot:run

