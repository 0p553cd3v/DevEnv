#!/bin/sh
CWD="$(pwd)"
cd
echo "$(pwd)"
mkdir docker-volumes
cd docker-volumes
#NOTE: Below please create dir for specific containers "mkdir container_name"


cd $CWD
cd ../
cp build/docker-compose.yaml $HOME/docker-volumes

#NOTE: Below please copy all necesary configs for specific containers "cp config/container_name/container_conig_name.yml $HOME/docker-volumes/container_name"

cd $HOME/docker-volumes
docker-compose up -d --force-recreate

