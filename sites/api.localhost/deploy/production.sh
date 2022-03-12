#!/bin/bash

source pre-deploy.sh

echo "----- Deploy production docker -----"    

cd ..
docker-compose -f docker-compose.production.yml up --build --force-recreate -d

cd deploy
source post-deploy.sh