#!/bin/bash

echo "----- Clearing local docker data -----"

yes | docker system prune -a
yes | docker system prune --volumes
yes | docker image prune --filter="dangling=true"