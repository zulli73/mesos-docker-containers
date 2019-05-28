FROM zulli73/mesos:1.8.0

#Oracle JDK, from https://stackoverflow.com/questions/19275856/auto-yes-to-the-license-agreement-on-sudo-apt-get-y-install-oracle-java7-instal
RUN apt-get update && apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:linuxuprising/java && \
    apt-get update && \
    echo oracle-java11-installer shared/accepted-oracle-license-v1-2 select true | /usr/bin/debconf-set-selections && \
    apt-get install -y oracle-java11-installer && \
    apt-get install oracle-java11-set-default && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN echo "geil"
ENV JAVA_HOME /usr/lib/jvm/java-11-oracle