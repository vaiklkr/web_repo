FROM centos:7.9.2009
RUN yum install zip -y && yum install unzip -y && yum install wget -y && yum install maven -y && yum install git -y && yum update -y
WORKDIR /mnt
RUN mkdir apache
WORKDIR /mnt/apache
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.65/bin/apache-tomcat-9.0.65.zip
RUN unzip apache-tomcat-9.0.65.zip
RUN rm -rf apache-tomcat-9.0.65.zip
RUN chmod -R 755 /mnt/apache/apache-tomcat-9.0.65
ENTRYPOINT ["/mnt/apache/apache-tomcat-9.0.65/bin/catalina.sh","run"]
WORKDIR /mnt
RUN git clone https://github.com/vaiklkr/game-of-life.git
WORKDIR /mnt/game-of-life
RUN mvn install
RUN cp /mnt/game-of-life/gameoflife-web/target/gameoflife.war /mnt/apache/apache-tomcat-9.0.65/webapps/
