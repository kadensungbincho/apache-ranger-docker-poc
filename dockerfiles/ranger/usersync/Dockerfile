FROM kadensungbincho/ranger-base:2.1.0

ENV RANGER_USERSYNC_HOME /opt/ranger_usersync

RUN tar -zxvf $RANGER_HOME/target/ranger-$RANGER_VERSION-usersync.tar.gz -C /opt \
    && ln -s /opt/ranger-$RANGER_VERSION-usersync $RANGER_USERSYNC_HOME \
    && rm -rf $RANGER_HOME

WORKDIR $RANGER_USERSYNC_HOME
