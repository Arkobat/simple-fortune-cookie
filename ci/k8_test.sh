#!/bin/bash

# Copy config
export KUBECONFIG=./kubernetes/config/config

# Start the service
kubectl apply -f kubernetes/
sleep 10s

# Retrive IP and port dynamicly
echo "Getting IP"
IP=`kubectl get nodes -o wide | tail -n 1 | awk '{print $7}'`

echo "Getting Ports: "
PORT=`kubectl get service frontend-svc | grep frontend | awk '{print $5}' | tr ":" "\t" | awk '{print $2}' | tr "/" "\t" | awk '{print $1}'`
DOMAIN=$IP:$PORT

echo "Domain is: $DOMAIN"

# Send post
curl -X POST "$DOMAIN/api/add" -H "Content-Type: application/json" -d "{\"message\":\"Test Cookie?\"}"
sleep 2s

# Retrive posted cookie
ALL=`curl "$DOMAIN/api/all" | grep "Test Cookie"`

if [ -z "$ALL" ]
then
    echo "Could not find any cookies with name test"
    exit 1
fi

echo "Test passed"
wait