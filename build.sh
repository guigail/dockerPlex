#!/bin/bash

PREFIX="sutat"
IMAGES_DIR="images"
CURRENT_DIR=$(pwd)
LOG_DIR="logs"
LOG_PATTERN="${LOG_DIR}/$(date +%Y%m%d_%H%M)_build_%%.log"

function build {
  log=$(echo ${CURRENT_DIR}/${LOG_PATTERN} | sed "s/%%/${1}/g")

  echo "Building ${1} ..."

  cd ${IMAGES_DIR}/${1}

  docker build --no-cache=true -t ${PREFIX}/${1}:latest  . > ${log}

  cd ${CURRENT_DIR}
}

IMAGES=$(ls ${IMAGES_DIR})

if [ ! -d ${LOG_DIR} ]; then
  mkdir ${LOG_DIR}
fi

for image in ${IMAGES}; do
  build ${image}
done

echo "Cleaning up images without tags ..."
docker rmi $(docker images -f 'dangling=true' -q)

echo "Running containers ..."
docker-compose up -d
