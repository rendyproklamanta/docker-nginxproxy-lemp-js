#!/bin/bash

source pre-deploy.sh

echo "----- Deploy local docker -----"

cd ..
docker-compose -f docker-compose.local.yml up --build --force-recreate -d

cd deploy
source post-deploy.sh