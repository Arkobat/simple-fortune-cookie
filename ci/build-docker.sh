#!/bin/bash
docker build -t "$docker_username/frontend:1.0-${GIT_COMMIT::4} ../frontend/" 
docker build -t "$docker_username/frontend:latest ../frontend/" 

docker build -t "$docker_username/backend:1.0-${GIT_COMMIT::4} ../backend/" 
docker build -t "$docker_username/backend:latest ../backend/" 

wait