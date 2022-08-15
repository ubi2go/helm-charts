#!/usr/bin/env bash
set +e
set -u
set -o pipefail

source /opt/${SOFTWARE_NAME}/bin/common-functions.sh

mysql --defaults-file=${BASE}/etc/my.cnf --protocol=tcp --user=root --host=localhost --port=${MYSQL_PORT} --batch --connect-timeout={{ $.Values.startupProbe.timeoutSeconds.application }} --execute="SHOW DATABASES;" | grep --silent 'mysql'
if [ $? -eq 0 ]; then
  echo 'MariaDB MySQL API reachable'
else
  echo 'MariaDB MySQL API not reachable'
  exit 1
fi

timeout {{ $.Values.startupProbe.timeoutSeconds.application }} bash -c "</dev/tcp/${CONTAINER_IP}/${GALERA_PORT}"
if [ $? -eq 0 ]; then
  echo 'MariaDB Galera API reachable'
else
  echo 'MariaDB Galera API not reachable'
  exit 1
fi

