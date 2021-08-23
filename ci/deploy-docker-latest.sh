#!/bin/bash
DockerRepo="${docker_username}"

echo "Building images..."
docker build -t "${DockerRepo}/sft-frontend:latest" frontend/
docker build -t "${DockerRepo}/sft-backend:latest" backend/

echo "Pushing images..."
docker login --username "$docker_username" --password "$docker_password"
docker push "$docker_username/sft-frontend:latest"
docker push "$docker_username/sft-backend:latest"

wait