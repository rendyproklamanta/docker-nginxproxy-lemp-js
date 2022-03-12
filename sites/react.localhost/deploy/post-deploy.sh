#!/bin/bash

docker-compose logs

if [[ $(docker-compose logs | grep -E 'crashed|error|TypeError') ]]
then
    echo "----- There is error in your script -----"    
    exit 1
else
    exit 0
fi