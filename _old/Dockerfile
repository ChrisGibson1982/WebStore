# docker RUN --name some-app --link some-mariadb:mysql -d application-that-uses-mysql
# docker build -t cgfootman/webstore:1.0.3 -t cgfootman/webstore:latest --rm=true -f Dockerfile . 

# docker push cgfootman/webstore:1.0.3 
# docker push cgfootman/webstore:latest

# docker run -d -p 8080:80 -e ALLOW_OVERRIDE=true  --name webstore cgfootman/webstore:latest 


FROM tutum/apache-php 
LABEL maintainer="cgfootman@hotmail.com" 
LABEL version="1.0.2"

RUN mkdir opencart 
RUN /usr/local/bin/composer self-update

ADD files/3.0.2.0-OpenCart app/
RUN ls app/

RUN cd app/upload && cp config-dist.php config.php
RUN cp app/upload/admin/config-dist.php app/upload/admin/config.php

RUN cd app/ && composer install 


EXPOSE 80
