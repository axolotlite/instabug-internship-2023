#!/bin/bash
#first we setup the required environmental variables for both the go app and container
export MYSQL_HOST="0.0.0.0"
export MYSQL_USER="admin"
export MYSQL_PASS="password"
export MYSQL_PORT="8080"
#the golang module requires mysql 4.1+, giving us leway on which docker image to use
#These tags report 0 vulnrabilities on dockerhub
tags=("5.6" "5.6.51" "8.0.18")
#I've picked a mysql 8 image because according to a quick google search, mysql 8 has 2x the performance of 5.
tag="8.0.18"
podman run --name mysql-testing \
    -e MYSQL_ROOT_PASSWORD="my-secret-pw" \
    -e MYSQL_USER=$MYSQL_USER \
    -e MYSQL_PASSWORD=$MYSQL_PASS \
    -e MYSQL_HOST=$MYSQL_HOST \
    -e MYSQL_PORT=$MYSQL_PORT \
    -e MYSQL_TCP_PORT=$MYSQL_PORT \
    -e MYSQL_DATABASE="internship" \
    -p $MYSQL_PORT:$MYSQL_PORT \
    -v $(pwd)/_db_data:/var/lib/mysql:z \
    -d mysql:$tag
