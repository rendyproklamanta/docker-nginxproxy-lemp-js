#!/bin/bash

source pre-deploy.sh
cd ..


echo "---[ Running Deployment ]---"

# Change service_name same as in your docker-compose.production.yml
service_name=sample_service
old_container_id=$(docker ps -f name=$service_name -q | tail -n1)

# bring a new container online, running new code
# (nginx continues routing to the old container only)
docker-compose -f docker-compose.production.yml up -d --no-deps --scale $service_name=2 --no-recreate --build $service_name

# wait for new container to be available
new_container_id=$(docker ps -f name=$service_name -q | head -n1)
new_container_ip=$(docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $new_container_id)
curl --silent --include --retry-connrefused --retry 30 --retry-delay 1 --fail http://$new_container_ip:3000/ || exit 1

# start routing requests to the new container (as well as the old)
docker exec nginx /usr/sbin/nginx -s reload

# take the old container offline
docker stop $old_container_id
docker rm $old_container_id

echo "---[ Completed Deployment ]---"


cd deploy
source post-deploy.sh

