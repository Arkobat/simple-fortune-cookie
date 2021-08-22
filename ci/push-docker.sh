#!/bin/bash
[[ -z "${GIT_COMMIT}" ]] && Tag='local' || Tag="${GIT_COMMIT::4}"
docker login --username "$docker_username" --password "$docker_password"
docker push "$docker_username/sft-frontend:1.0-${Tag}" 
docker push "$docker_username/sft-frontend:latest" 

docker push "$docker_username/sft-backend:1.0-${Tag}" 
docker push "$docker_username/sft-backend:latest" 

wait