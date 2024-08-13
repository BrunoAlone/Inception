#!/bin/sh
# Start MariaDB

# Inicia o serviço MariaDB no container
echo "STARTING MARIA_DB"

#rc-service mariadb start
#sleep 5

# Configure MariaDB

if [ ! -d "/var/lib/mysql/mysql"]; then
	mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi

mysqld_safe --datadir='/var/lib/mysql' & sleep 5

echo "CONFIGURING MARIA_DB"

mysql -e "CREATE USER IF NOT EXISTS '${DB_USER}';"
mysql -e "CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';"
mysql -e "FLUSH PRIVILEGES;"

wait










# Create user if not exists

#mariadb -e "CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';"

# Grant privileges to user

#mariadb -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';"

# Flush privileges to apply changes

#mariadb -e "FLUSH PRIVILEGES;"

# Restart MariaDB

# Shutdown to restart with the config above

echo "SHUTING DOWN MARIA_DB"

mysqladmin -u root -p${DB_PASSWORD_ROOT} shutdown

# Restart MariaDB, with the new configs, in the backgroundso it keeps running
echo "RESTARTING MARIA_DB"

mysqld_safe --port=3306 --bind-address=0.0.0.0 --datadir='/var/lib/mysql'
