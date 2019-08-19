#!/usr/bin/env bash
JMODELICA_HOME=JModelica.org
if [ -d ${JMODELICA_HOME} ] 
then
    rm -rf ${JMODELICA_HOME}
else
    echo ""
fi
svn co https://svn.jmodelica.org/trunk ${JMODELICA_HOME}

cd ${JMODELICA_HOME}
docker build -f ./Dockerfile_full_image --no-cache  --build-arg DOCKER_LINUX_DIST=jmodelica/ubuntu_base --build-arg DOCKER_DIST_TAG=18.04 --build-arg DOCKER_JM_TESTS_WS=/home/baseuser/ -t fullimage/jmodelica  .
cd ..
docker build --no-cache -t jmodelica/bettercallbene .
