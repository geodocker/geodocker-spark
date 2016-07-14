# GeoDocker Spark

[![Build Status](https://api.travis-ci.org/geodocker/geodocker-spark.svg)](http://travis-ci.org/geodocker/geodocker-spark)
[![Docker Repository on Quay](https://quay.io/repository/geodocker/base/status "Docker Repository on Quay")](https://quay.io/repository/geodocker/spark)
[![Join the chat at https://gitter.im/geotrellis/geotrellis](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/geotrellis/geotrellis?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

[Apache spark](https://spark.apache.org/) container for [GeoDocker Cluster](https://github.com/geodocker/geodocker)

# Roles
This container has three roles that can be supplied as `CMD`:

  - `master`
  - `worker`

# Environment
  - `HADOOP_MASTER_ADDRESS` - hostname for hdfs root, required for all roles
  - `SPARK_MASTER` - spark master hostname, required for all roles
