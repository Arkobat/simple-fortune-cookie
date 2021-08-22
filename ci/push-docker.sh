#!/bin/bash
docker login --username "$docker_username" --password "$docker_password"
docker push "$docker_username/frontend:1.0-${GIT_COMMIT::4}" 
docker push "$docker_username/frontend:latest" 

docker push "$docker_username/backend:1.0-${GIT_COMMIT::4}" 
docker push "$docker_username/backend:latest" 

wait