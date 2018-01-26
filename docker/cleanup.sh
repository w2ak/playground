#!/bin/bash
# Credits: from Mugify@GistHub (https://gist.github.com/mugifly)

echo -e "-- Removing exited containers --"
docker ps --all --quiet --filter="status=exited" |
  xargs --no-run-if-empty docker rm --volumes

echo -e "\n-- Removing untagged images --"
docker images | awk '/^<none>/ { print $3 }' |
  xargs --no-run-if-empty docker rmi --force

echo -e "\n-- Removing volume directories --"
docker volume ls --quiet --filter="dangling=true" |
  xargs --no-run-if-empty docker volume rm

echo -e "\nDone :)"
