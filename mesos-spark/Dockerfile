FROM zulli73/mesos-java:1.8.0

ARG SPARK_VERSION=2.4.3
ARG HADOOP_PROFILE=2.7
ARG SPARK_BINARY=spark-${SPARK_VERSION}-bin-hadoop${HADOOP_PROFILE}.tgz

RUN apt-get update && apt-get install -y curl && \
    mkdir -p /spark && \
    curl -o /spark/${SPARK_BINARY} http://www.apache.org/dist/spark/spark-${SPARK_VERSION}/${SPARK_BINARY} && \
    tar -xzf /spark/${SPARK_BINARY} -C /spark --strip-components 1

ENV SPARK_HOME /spark
ENV PATH=$PATH:$SPARK_HOME/bin

COPY spark-defaults.conf ${SPARK_HOME}/conf
COPY bootstrap.sh ${SPARK_HOME}
COPY entrypoint.sh /

EXPOSE 4040

ENTRYPOINT ["/entrypoint.sh"]