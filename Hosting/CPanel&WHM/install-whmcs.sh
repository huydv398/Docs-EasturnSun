set -e 
mysqlRootPass="123@@"
databasename="whcms_db"
username="whcms_user"
userpassword="123@@123"
host='localhost'

#license: b6ffb6699450271d58b12a01c1e6c5a2
sudo setenforce 0
sed -i 's/SELINUX=enforcing/SELINUX=permissive/g' /etc/selinux/config

yum install epel-release -y && yum update -y 

#HTTP
yum -y install httpd
systemctl start httpd
systemctl enable httpd

#php
yum install epel-release
yum update epel-release
yum -y install yum-utils
rpm -Uvh https://rpms.remirepo.net/enterprise/remi-release-7.rpm
yum-config-manager --enable remi-php73
yum -y install php php-opcache php-mysql
echo "<?php phpinfo(); ?>" > /var/www/html/info.php
firewall-cmd --zone=public --add-port=80/tcp --permanent
firewall-cmd --reload

yum install -y php php-mbstring php-pear php72-php-pdo.x86_64 php-pdo.x86_64 php-mysql.x86_64 php-ioncube-loader.x86_64 php-curl curl php-soap.x86_64 php72-php-soap.x86_64 php-gd.x86_64 php72-php-gd.x86_64 

# mariadb
yum -y install mariadb mariadb-server
systemctl start mariadb
systemctl enable mariadb
echo -e "\ny\n$mysqlRootPass\n$mysqlRootPass\ny\ny\ny\ny\ny\n" |mysql_secure_installation --stdin
mysql -u root -p$mysqlRootPass<<EOF 
CREATE DATABASE $databasename;
CREATE USER $username@$host IDENTIFIED BY '$userpassword';
GRANT ALL PRIVILEGES ON $databasename.* TO $username@$host IDENTIFIED BY '$userpassword';
FLUSH PRIVILEGES;
exit
EOF

systemctl restart httpd

echo 'date.timezone = "Asia/Ho_Chi_Minh"
memory_limit = 1024M
extension=pdo.so
extension=pdo_mysql.so'>>/etc/php.ini

chown -R apache:apache /var/www/html/
mv /var/www/html/configuration.php.new /var/www/html/configuration.php
chmod 777 /var/www/html/configuration.php

# rm -rf /var/www/html/install/
mv /var/www/html/attachments/ /var/www/attachments/
mv /var/www/html/downloads/ /var/www/downloads/
mv /var/www/html/templates_c/ /var/www/templates_c/
chmod 777 /var/www/attachments/ /var/www/downloads/ /var/www/templates_c/
chown apache:apache /var/www/attachments/ /var/www/downloads/ /var/www/templates_c/

echo '$mysql_charset = "utf8";
$display_errors="off";
$templates_compiledir = "/var/www/templates_c/";
$attachments_dir = "/var/www/attachments/";
$downloads_dir = "/var/www/downloads/";'>> /var/www/html/configuration.php

echo '*/5 * * * * root /usr/bin/php -q /var/www/html/crons/cron.php'>>/etc/crontab