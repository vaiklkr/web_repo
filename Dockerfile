FROM centos:7.9.2009
RUN yum install zip -y && yum install unzip -y && yum install httpd -y
WORKDIR /var/www/html
ADD https://www.free-css.com/assets/files/free-css-templates/download/page247/kindle.zip /var/www/html/
RUN unzip kindle.zip
RUN rm -rf kindle.zip
RUN rm -rf __MACOSX
RUN mv markups-kindle/* .
RUN rm -rf markups-kindle 
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
