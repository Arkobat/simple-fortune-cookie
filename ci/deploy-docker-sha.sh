#!/bin/bash
DockerRepo="${docker_username}"
[[ -z "${GIT_COMMIT}" ]] && Tag='local' || Tag="${GIT_COMMIT::4}"

echo "Building images..."
docker build -t "${DockerRepo}/sft-frontend:1.0-${Tag}" frontend/
docker build -t "${DockerRepo}/sft-backend:1.0-${Tag}" backend/

echo "Pushing images..."
docker login --username "$docker_username" --password "$docker_password"
docker push "$docker_username/sft-frontend:1.0-$Tag" 
docker push "$docker_username/sft-backend:1.0-$Tag" 

wait