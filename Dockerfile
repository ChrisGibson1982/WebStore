# docker RUN --name some-app --link some-mariadb:mysql -d application-that-uses-mysql
# docker build -t cgfootman/webstore:1.0.0 -t cgfootman/webstore:latest --rm=true -f Dockerfile . 
# docker run -d -p 8080:80 --name webstore cgfootman/webstore:latest

FROM cgfootman/c7-systemd
LABEL maintainer="cgfootman@hotmail.com" 
LABEL version="1.0.0"

RUN yum -y install httpd; yum clean all; systemctl enable httpd.service


RUN sed -i 's/AllowOverride None/AllowOverride All/g' /etc/httpd/conf/httpd.conf 
RUN yum -y install php php-mysql php-gd php-ldap php-odbc php-pear php-xml php-xmlrpc php-mbstring php-snmp php-soap php-mcrypt curl zlib
RUN yum -y install epel-release && yum -y install phpmyadmin zip unzip
RUN yum clean all && rm -rf /var/cache/yum

RUN mkdir opencart 
COPY files/3.0.2.0-OpenCart.zip /opencart

RUN cd opencart && unzip 3.0.2.0-OpenCart.zip 
RUN cp -avr opencart /var/www/html
RUN cd /var/www/html && chmod -R 775 opencart && chown apache:apache opencart
RUN cd /var/www/html/opencart/upload && cp config-dist.php config.php
RUN cp /var/www/html/opencart/upload/admin/config-dist.php /var/www/html/opencart/upload/admin/config.php


EXPOSE 80
CMD ["/usr/sbin/init"]