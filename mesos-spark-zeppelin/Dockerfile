FROM zulli73/mesos-spark:mesos-1.8.0-spark-2.4.3

ARG ZEPPELIN_VERSION=0.8.1

RUN mkdir -p /zeppelin && \
    curl -Ls -o /zeppelin/zeppelin-${ZEPPELIN_VERSION} https://www-eu.apache.org/dist/zeppelin/zeppelin-${ZEPPELIN_VERSION}/zeppelin-${ZEPPELIN_VERSION}-bin-all.tgz && \
    tar -xzf /zeppelin/zeppelin-${ZEPPELIN_VERSION} -C /zeppelin --strip-components 1

ENV PYSPARK_PYTHON=python3

EXPOSE 8080

WORKDIR /zeppelin

COPY shiro.ini /zeppelin/conf
COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]