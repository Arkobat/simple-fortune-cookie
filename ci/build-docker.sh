#!/bin/bash
DockerRepo="${docker_username}"
[[ -z "${GIT_COMMIT}" ]] && Tag='local' || Tag="${GIT_COMMIT::4}"
docker build -t "${DockerRepo}/sft-frontend:latest" -t "${DockerRepo}/sft-frontend:1.0-${Tag}" frontend/
docker build -t "${DockerRepo}/sft-backend:latest" -t "${DockerRepo}/sft-backend:1.0-${Tag}" backend/
wait


