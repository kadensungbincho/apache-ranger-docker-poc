FROM bde2020/hadoop-base:2.0.0-hadoop3.2.1-java8

# Allow buildtime config of HIVE_VERSION
ARG HIVE_VERSION
ENV HIVE_VERSION=${HIVE_VERSION:-3.1.2}
ARG MYSQL_CONNECTOR_JAVA_VERSION
ENV MYSQL_CONNECTOR_JAVA_VERSION=${MYSQL_CONNECTOR_JAVA_VERSION:-8.0.21}
ARG RANGER_VERSION
ENV RANGER_VERSION=${RANGER_VERSION:-2.1.0}

ENV HIVE_HOME /opt/hive
ENV PATH $HIVE_HOME/bin:$PATH
ENV HADOOP_HOME /opt/hadoop-$HADOOP_VERSION

WORKDIR /opt

#Install Hive and PostgreSQL JDBCf
RUN apt-get update -o Acquire::CompressionTypes::Order::=gz && apt-get install -y wget procps && \
	wget https://archive.apache.org/dist/hive/hive-$HIVE_VERSION/apache-hive-$HIVE_VERSION-bin.tar.gz && \
	tar -xzvf apache-hive-$HIVE_VERSION-bin.tar.gz && \
	mv apache-hive-$HIVE_VERSION-bin hive && \
	wget https://repo1.maven.org/maven2/mysql/mysql-connector-java/$MYSQL_CONNECTOR_JAVA_VERSION/mysql-connector-java-$MYSQL_CONNECTOR_JAVA_VERSION.jar -O $HIVE_HOME/lib/mysql-connector-java-$MYSQL_CONNECTOR_JAVA_VERSION.jar && \
	rm apache-hive-$HIVE_VERSION-bin.tar.gz && \
	apt-get --purge remove -y wget && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

# https://issues.apache.org/jira/browse/HIVE-22915
RUN rm $HIVE_HOME/lib/guava-19.0.jar && \
    cp $HADOOP_HOME/share/hadoop/hdfs/lib/guava-27.0-jre.jar $HIVE_HOME/lib/

ADD conf/hive-site.xml $HIVE_HOME/conf
ADD conf/beeline-log4j2.properties $HIVE_HOME/conf
ADD conf/hive-env.sh $HIVE_HOME/conf
ADD conf/hive-exec-log4j2.properties $HIVE_HOME/conf
ADD conf/hive-log4j2.properties $HIVE_HOME/conf
ADD conf/ivysettings.xml $HIVE_HOME/conf
ADD conf/llap-daemon-log4j2.properties $HIVE_HOME/conf

# Overwrite entrypoint.sh
ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

ADD run.sh /run.sh
RUN chmod a+x /run.sh

# Add Ranger Hive Plugin
ENV RANGER_HIVE_PLUGIN_HOME /opt/ranger-hive-plugin
COPY ranger-${RANGER_VERSION}-hive-plugin.tar.gz /opt/ranger-${RANGER_VERSION}-hive-plugin.tar.gz

WORKDIR /opt

RUN tar -xvf ranger-${RANGER_VERSION}-hive-plugin.tar.gz \
    && ln -s ranger-${RANGER_VERSION}-hive-plugin $RANGER_HIVE_PLUGIN_HOME \
    && rm -f ranger-${RANGER_VERSION}-hive-plugin.tar.gz

RUN groupadd hadoop \
    && useradd -G hadoop hive

EXPOSE 10000
EXPOSE 10002

CMD ["/run.sh"]
