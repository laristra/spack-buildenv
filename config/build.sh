#!/bin/bash

if [ -z "$1" ]
then
  echo "==> This script takes an input parameter that specified the Dockerfile and .yaml name, eg. fedora30, ubuntu18, centos8, etc."
  exit 1
fi

rm Dockerfile || /bin/true
cp $1 Dockerfile

rm packages.yaml || /bin/true
cp $1.yaml packages.yaml

docker build -t laristra/spack-base:$1 .
docker push laristra/spack-base:$1
