FROM centos:7.9.2009
RUN yum install zip -y && yum install unzip -y && yum install httpd -y
WORKDIR /var/www/html
ADD https://www.free-css.com/assets/files/free-css-templates/download/page281/cs.zip /var/www/html/
RUN unzip cs.zip
RUN rm -rf cs.zip
RUN mv cs/* .
RUN rm -rf cs
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
