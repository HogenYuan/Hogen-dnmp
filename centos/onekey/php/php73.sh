#!/bin/bash
#文档 https://www.itgeeker.net/php7-3-yum-install-on-centos-7/
yum install epel-release -y
rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
yum --enablerepo=remi install php73-php php73-php-pear php73-php-bcmath php73-php-pecl-jsond-devel php73-php-mysqlnd \
    php73-php-gd php73-php-common php73-php-fpm php73-php-intl php73-php-cli php73-php php73-php-xml php73-php-opcache \
    php73-php-pecl-apcu php73-php-pdo php73-php-gmp php73-php-process php73-php-pecl-imagick php73-php-devel \
    php73-php-mbstring php73-php-zip php73-php-ldap php73-php-imap php73-php-pecl-mcrypt -y
systemctl restart php73-php-fpm
systemctl enable php73-php-fpm
mv /opt/remi/php73/root/usr/bin/php/  /usr/local/etc/php/
ln -s /usr/local/etc/php/ /usr/bin/php