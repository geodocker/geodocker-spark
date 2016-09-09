FROM quay.io/geodocker/hdfs:latest

MAINTAINER Pomadchin Grigory, daunnc@gmail.com

ENV SPARK_HOME /opt/spark
ENV SPARK_CONF_DIR $SPARK_HOME/conf
ENV PATH $PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin

RUN set -x \
    && mkdir -p $SPARK_HOME $SPARK_CONF_DIR \
    && curl -sS -# http://d3kbcqa49mib13.cloudfront.net/spark-2.0.0-bin-hadoop2.7.tgz \
    | tar -xz -C ${SPARK_HOME} --strip-components=1

COPY ./fs /

RUN mkdir -p /data/spark

VOLUME [ "/data/spark" ]

WORKDIR "${SPARK_HOME}"
ENTRYPOINT [ "/sbin/entrypoint.sh" ]
