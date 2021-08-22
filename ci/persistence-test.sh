#!/bin/bash
docker-compose up -d
sleep 10s
curl -X POST localhost:8080/api/add -H "Content-Type: application/json" -d "{\"message\":\"Test Cookie?\"}"
sleep 2s

ALL=`curl localhost:8080/api/all | grep "Test Cookie"`

if [ -z "$ALL" ]
then
    echo "Could not find any cookies with name test before restart"
    exit 1
fi

docker-compose down
sleep 3s
docker-compose up -d
sleep 3s

ALL=`curl localhost:8080/api/all | grep "Test Cookie2"`


if [ -z "$ALL" ]
then
    echo "Could not find any cookies with name test after restart"
    exit 1
fi

echo "Test passed"
wait


