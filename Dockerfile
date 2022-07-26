FROM centos:7.9.2009
RUN yum install zip -y && yum install unzip -y && yum install httpd -y
WORKDIR /var/www/html
ADD https://www.free-css.com/assets/files/free-css-templates/download/page281/traveler.zip /var/www/html/
RUN unzip traveler.zip
RUN rm -rf traveler.zip
RUN mv free-travel-website-template/* .
RUN rm -rf free-travel-website-template
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
