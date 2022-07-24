FROM centos:7.9.2009
RUN yum install zip -y && yum install unzip -y && yum install httpd -y
WORKDIR /var/www/html
ADD https://www.free-css.com/assets/files/free-css-templates/download/page280/webwing.zip /var/www/html/
RUN unzip webwing.zip
RUN rm -rf webwing.zip
RUN mv html/* .
RUN rm -rf html
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
