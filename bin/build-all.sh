#!/bin/bash

tag=$1
prefix=zulli73

spark_tag=2.4.3
zeppelin_tag=0.8.1

dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
home="$(dirname "$dir")"

if [ -z ${tag} ]
then
   echo "No tag provided, building with tag 'latest'"
   echo "To provide specific tag, invoke script with tag argument: build-all.sh <tag>"
   tag=latest
else
   echo "Starting build with tag $tag"
fi

docker build --tag ${prefix}/mesos:${tag}                                  ${home}/mesos
docker build --tag ${prefix}/mesos-java:${tag}                             ${home}/mesos-java
docker build --tag ${prefix}/mesos-master:${tag}                           ${home}/mesos-master
docker build --tag ${prefix}/mesos-slave:${tag}                            ${home}/mesos-slave

if [ "$tag" = "latest" ]
then
   docker build --tag ${prefix}/mesos-spark:${tag}            ${home}/mesos-spark
   docker build --tag ${prefix}/mesos-spark-zeppelin:${tag}   ${home}/mesos-spark
else
   docker build --tag ${prefix}/mesos-spark:mesos-${tag}-spark-${spark_tag}                            ${home}/mesos-spark
   docker build --tag ${prefix}/mesos-spark-zeppelin:mesos-${tag}-spark-${spark_tag}-zeppelin-${zeppelin_tag}   ${home}/mesos-spark-zeppelin
fi