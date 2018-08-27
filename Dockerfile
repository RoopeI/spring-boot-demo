FROM ubuntu:latest

# Verify the version exists here or else change it: http://apache.mirrors.tds.net/tomcat/tomcat-8/
ENV TOMCAT_VERSION 8.5.33

RUN apt-get update && apt-get -y upgrade && apt-get install -y wget && apt-get -y install software-properties-common

# Add java repo
RUN add-apt-repository ppa:webupd8team/java

# Accept the license
RUN echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 boolean true" | debconf-set-selections

# Install java
RUN apt-get -y install oracle-java8-installer

# Get Tomcat and extract it
RUN wget --quiet --no-cookies http://apache.mirrors.tds.net/tomcat/tomcat-8/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz -O /tmp/tomcat.tgz && \
tar xzvf /tmp/tomcat.tgz -C /opt

# Rename
RUN mv /opt/apache-tomcat-${TOMCAT_VERSION} /opt/tomcat

# Clean up
RUN rm /tmp/tomcat.tgz  && rm -rf /opt/tomcat/webapps/examples && rm -rf /opt/tomcat/webapps/docs && rm -rf /opt/tomcat/webapps/ROOT

# Change workdir
WORKDIR /opt/tomcat

# Launch Tomcat
CMD ["/opt/tomcat/bin/catalina.sh", "run"]