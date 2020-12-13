#!/bin/bash
set -xe

cp /templates/* /opt/ranger_usersync/templates

./setup.sh

sleep 300

./ranger-usersync-services.sh start
tail -f $(grep 'logdir' ./install.properties  | sed -e 's#.*=\(\)#\1#')/usersync-usersync-ldap-.log
