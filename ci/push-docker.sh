#!/bin/bash
docker login --username "$docker_username" --password "$docker_password"
docker-compose push "$docker_username/frontend:1.0-${GIT_COMMIT::4}" 
docker-compose push "$docker_username/frontend:latest" 

docker-compose push "$docker_username/backend:1.0-${GIT_COMMIT::4}" 
docker-compose push "$docker_username/backend:latest" 

docker-compose push "$docker_username/redis:1.0-${GIT_COMMIT::4}" 
docker-compose push "$docker_username/redis:latest" 
wait