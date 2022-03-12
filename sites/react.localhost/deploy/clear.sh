#!/bin/bash

echo "----- Clearing local docker data -----"

yes | docker system prune -a
yes | docker image prune --filter="dangling=true"