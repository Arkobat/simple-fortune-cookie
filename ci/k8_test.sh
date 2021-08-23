#!/bin/bash

# Copy config
echo 'export KUBECONFIG=./kubernetes/config/config' >> $HOME/.bashrc

# Start the service
echo "Step 1"
echo `docker ps | grep kube-apiserver`
cat $HOME/.kube/config

kubectl apply -f kubernetes/
echo "Step 2"
sleep 10s

echo "Step 3"
# Retrive IP and port dynamicly
echo "Getting IPs: "
echo "Step 4"
kubectl get nodes -o wide | tail -n 1 | awk '{print $7}'
echo "Step 5"
echo `kubectl get nodes -o wide | tail -n 1 | awk '{print $7}'`
echo "Step 6"
IP=`kubectl get nodes -o wide | tail -n 1 | awk '{print $7}'`

echo "Step 7"
echo "Getting Ports: "
echo "Step 8"
kubectl get service frontend-svc | grep frontend | awk '{print $5}' | tr ":" "\t" | awk '{print $2}' | tr "/" "\t" | awk '{print $1}'
echo "Step 9"
echo `kubectl get service frontend-svc | grep frontend | awk '{print $5}' | tr ":" "\t" | awk '{print $2}' | tr "/" "\t" | awk '{print $1}'`
echo "Step 10"
PORT=`kubectl get service frontend-svc | grep frontend | awk '{print $5}' | tr ":" "\t" | awk '{print $2}' | tr "/" "\t" | awk '{print $1}'`
echo "Step 11"
DOMAIN=$IP:$PORT

echo "Step 12"
echo "Domain is: $DOMAIN"

echo "Step 13"
# Send post
curl -X POST "$DOMAIN/api/add" -H "Content-Type: application/json" -d "{\"message\":\"Test Cookie?\"}"
sleep 2s

echo "Step 14"
# Retrive posted cookie
ALL=`curl "$DOMAIN/api/all" | grep "Test Cookie"`

echo "Step 15"
if [ -z "$ALL" ]
then
    echo "Could not find any cookies with name test"
    exit 1
fi

echo "Test passed"
wait