# docker RUN --name some-app --link some-mariadb:mysql -d application-that-uses-mysql
# docker build -t cgfootman/webstore:1.0.4 -t cgfootman/webstore:latest --rm=true -f Dockerfile . 

# docker push cgfootman/webstore:1.0.4 
# docker push cgfootman/webstore:latest



FROM python
LABEL maintainer="cgfootman@hotmail.com" 
LABEL version="1.0.4"

RUN pip install flask



EXPOSE 80
