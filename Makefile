FROM centos

RUN yum -y install httpd
WORKDIR /var/www/html/
RUN echo "hello v1" > index.html

export 80

# Use "exec" form so that it runs as PID 1 (useful for graceful shutdown)
CMD ["apachectl -D FOREGROUND"]
