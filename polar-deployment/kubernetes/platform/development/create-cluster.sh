#!/bin/bash

echo "Initializing Kubernetes cluster..."

minikube start --cpus 2 --memory 4g --driver docker --profile polar

echo "Enabling NGINX Ingress Controller..."

minikube addons enable ingress --profile polar

sleep 15

echo "Deploying platform services"

kubectl apply -f services

sleep 5

echo "Waiting for PostgreSQL to be deployed..."

while [ $(kubectl get pod -l db=polar-postgres | wc -l) -eq 0 ]; do
  sleep 5
done

echo "Waiting for PostgreSQL to be ready..."

kubectl wait \
  --for=condition=ready pod \
  --selector=db=polar-postgres \
  --timeout=180s

echo "Waiting for Redis to be deployed..."

while [ $(kubectl get pod -l db=polar-redis | wc -l) -eq 0 ]; do
  sleep 5
done

echo "Waiting for Redis to be ready..."

kubectl wait \
  --for=condition=ready pod \
  --selector=db=polar-redis \
  --timeout=180s

echo "⛵ Happy Sailing!"
