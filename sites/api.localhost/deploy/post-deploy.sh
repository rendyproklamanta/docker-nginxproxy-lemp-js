#!/bin/bash

# Catch the logs
docker logs $new_container_id 2>&1

if [[ $(docker logs $new_container_id 2>&1 | grep -E 'crashed|error|TypeError') ]]
then

    # take new container offline because error
    docker stop $new_container_id
    docker rm $new_container_id
    
    echo "-----[ New running container $new_container_id has been removed because there is an error! ]-----"   

    exit 1
else

    # take old container offline
    docker stop $old_container_id
    docker rm $old_container_id

    echo "Success removed old container :" $old_container_id
    echo "-----[ Completed Deployment ]-----"

    exit 0
fi

