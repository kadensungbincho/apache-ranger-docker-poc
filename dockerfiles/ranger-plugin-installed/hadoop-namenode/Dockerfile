FROM bde2020/hadoop-namenode:2.0.0-hadoop3.2.1-java8

ENV RANGER_HDFS_PLUGIN_HOME /opt/ranger-hdfs-plugin
ENV RANGER_VERSION 2.1.0

COPY ./ranger-${RANGER_VERSION}-hdfs-plugin.tar.gz /opt/ranger-${RANGER_VERSION}-hdfs-plugin.tar.gz

WORKDIR /opt

RUN tar -xvf ranger-${RANGER_VERSION}-hdfs-plugin.tar.gz \
    && ln -s ranger-${RANGER_VERSION}-hdfs-plugin $RANGER_HDFS_PLUGIN_HOME \
    && rm -f ranger-${RANGER_VERSION}-hdfs-plugin.tar.gz \
    && curl https://repo1.maven.org/maven2/commons-lang/commons-lang/2.6/commons-lang-2.6.jar -o $RANGER_HDFS_PLUGIN_HOME/lib/commons-lang-2.6.jar \
    && curl https://repo1.maven.org/maven2/org/apache/logging/log4j/log4j-api/2.13.3/log4j-api-2.13.3.jar  -o $RANGER_HDFS_PLUGIN_HOME/lib/log4j-api-2.13.3.jar \
    && groupadd hadoop && adduser hdfs && usermod -aG hadoop hdfs

ADD run.sh /run.sh
RUN chmod a+x /run.sh

CMD ["/run.sh"]
