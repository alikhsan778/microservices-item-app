#!/bin/bash

IMAGE_NAME="item-app"
IMAGE_TAG="v2"
FINAL_IMAGE_NAME="docker.pkg.github.com/alikhsan778/microservices-item-app/$IMAGE_NAME:$IMAGE_TAG"

docker build -t $IMAGE_NAME:$IMAGE_TAG .
docker images
docker tag $IMAGE_NAME:$IMAGE_TAG $FINAL_IMAGE_NAME

echo $TOKEN_GITHUB | docker login docker.pkg.github.com -u alikhsan778 --password-stdin

docker push $FINAL_IMAGE_NAME