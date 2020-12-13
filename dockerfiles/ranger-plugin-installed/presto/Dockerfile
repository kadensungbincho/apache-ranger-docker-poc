FROM prestosql/presto:344

ENV RANGER_VERSION 2.1.0

USER root

# Add Ranger Presto Plugin
ENV RANGER_PLUGIN_HOME /usr/lib/presto/ranger-presto-plugin
COPY ranger-${RANGER_VERSION}-presto-plugin.tar.gz /usr/lib/presto/ranger-${RANGER_VERSION}-presto-plugin.tar.gz

WORKDIR /usr/lib/presto

RUN tar -xvf ranger-${RANGER_VERSION}-presto-plugin.tar.gz \
    && ln -s ranger-${RANGER_VERSION}-presto-plugin $RANGER_PLUGIN_HOME \
    && rm -f ranger-${RANGER_VERSION}-presto-plugin.tar.gz

ADD run.sh /run.sh

CMD ["/run.sh"]
