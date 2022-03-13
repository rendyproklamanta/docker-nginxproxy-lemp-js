#!/bin/bash

source pre-deploy.sh
cd ..


echo "-----[ Running Production Deployment ]-----"

# Change service_name same as in your docker-compose.production.yml
service_name=react-production
docker_compose_name=docker-compose.production.yml

old_container_id=$(docker ps -f name=$service_name -q | tail -n1)

# bring a new container online, running new code
# (nginx continues routing to the old container only)
docker-compose -f $docker_compose_name up -d --no-deps --scale $service_name=2 --no-recreate --build $service_name

# wait for new container to be available
new_container_id=$(docker ps -f name=$service_name -q | head -n1)


cd deploy
source post-deploy.sh