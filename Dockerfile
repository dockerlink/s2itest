FROM centos

MAINTAINER dockerlink<dockerlink@github.com>

LABEL version="V20201003"
LABEL description="A Test For S2I"

ENV PORT 80
RUN yum -y install httpd && yum clean all

WORKDIR /var/www/html/
RUN echo "hello v1" > index.html && sed -ri -e '/^Listen 80/c\Listen ${Port}' /etc/httpd/conf/httpd.conf

EXPOSE ${PORT}
VOLUME /var/www/html

# Use "exec" form so that it runs as PID 1 (useful for graceful shutdown)
ENTRYPOINT ["/usr/sbin/httpd"]
CMD ["-D", "FOREGROUND"]
