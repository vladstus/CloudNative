#!/bin/sh

echo "🏴️ Destroying Kubernetes cluster...\n"

minikube stop --profile polar

minikube delete --profile polar

echo "\n🏴️ Cluster destroyed\n"