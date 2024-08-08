FROM tomcat:9.0
RUN mv webapps webapps2
RUN cp -r webapps.dist/ webapps

COPY target/LoginWebApp.war /usr/local/tomcat/webapps/LoginWebApp.war
