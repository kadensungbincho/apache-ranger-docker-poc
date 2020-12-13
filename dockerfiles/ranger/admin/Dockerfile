FROM kadensungbincho/ranger-base:2.1.0

ENV RANGER_ADMIN_HOME /opt/ranger_admin

RUN tar -zxvf $RANGER_HOME/target/ranger-$RANGER_VERSION-admin.tar.gz -C /opt \
    && ln -s /opt/ranger-$RANGER_VERSION-admin $RANGER_ADMIN_HOME \
    && rm -rf $RANGER_HOME

WORKDIR $RANGER_ADMIN_HOME
