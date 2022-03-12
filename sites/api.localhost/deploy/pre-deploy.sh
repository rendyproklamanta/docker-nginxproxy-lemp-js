#!/bin/bash

echo "----- Running Predeploy -----"  

yes | docker image prune --filter="dangling=true"

docker network create nginx-proxy