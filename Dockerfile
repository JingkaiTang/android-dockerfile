FROM ubuntu:16.04

# Install base tools
RUN apt update && \
    apt install -y software-properties-common
   
# Install oracle jdk 8
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
    add-apt-repository -y ppa:webupd8team/java && \
    apt-get update && \
    apt-get install -y oracle-java8-installer 

# Set JAVA_HOME
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# Clear cache
RUN rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/apt && \
    rm -rf /var/cache/oracle-jdk8-installer

# Test
RUN java -version

