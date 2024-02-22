#!/bin/bash

#get tag
customTag=$1

#update repo
cd examples
git fetch --all
git reset --hard origin/main

cd ..

#build image
minikube image build -t faurecia-app:$customTag -f ./Dockerfile .

kubectl set image deployment/faurecia-app faurecia-app=faurecia-app:$customTag