#!/bin/bash
#
# VARIABLES
#
randomstring=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)
sleeptime=1
container="debian"
containerversion='latest'
containerfullname="${container}_${containerversion}_${randomstring}"
containerpath="pilbbq/$container:$containerversion"
containerhostname="container-$container-$randomstring"
#
# SCRIPT
#
echo "####################################################################################################"
echo "Running a new $container container version $containerversion interactively"
echo "####################################################################################################"
sleep $sleeptime
sudo docker run --name $containerfullname -h $containerhostname -it $containerpath /bin/bash

read -p "Do you wish to remove all docker containers and local data ? (y/N) " RESP
if [ "$RESP" = "y" ]; then
  echo -e "Removing everything ... \n"
  sudo docker container stop $(sudo docker container ls -aq)
  sudo docker system prune -a -f
else
  echo -e "Exiting without removing anything \n"
fi
