#!/bin/bash
set -xe

./setup.sh

./ranger-usersync-services.sh start
tail -f $(grep 'logdir' ./install-hdfs.properties  | sed -e 's#.*=\(\)#\1#')/usersync-usersync-.log
