#! /usr/bin/env bash
set -eo pipefail
source /sbin/hdfs-lib.sh

template $HADOOP_CONF_DIR/core-site.xml
template $HADOOP_CONF_DIR/hdfs-site.xml

# Run in all cases
if [[ ! -v ${HADOOP_MASTER_ADDRESS} ]]; then
  sed -i.bak "s/{HADOOP_MASTER_ADDRESS}/${HADOOP_MASTER_ADDRESS}/g" ${HADOOP_CONF_DIR}/core-site.xml
fi

# Determine whether this container will run as master, worker, or with another command
if [ -z "$1" ]; then
  echo "Select the role for this container with the docker cmd 'master' or 'worker'"
else
  if [ $1 = "master" ]; then
    exec spark-class org.apache.spark.deploy.master.Master --host $(hostname)
  elif [ $1 = "worker" ]; then
    exec spark-class org.apache.spark.deploy.worker.Worker --host $(hostname) spark://${SPARK_MASTER}:7077
  else
    exec "$@"
  fi
fi
