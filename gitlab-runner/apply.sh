#!/bin/bash
kubectl apply -f namespace.yaml
kubectl apply -f service-account.yaml
kubectl apply -f configmap.yaml
kubectl apply -f deployment.yaml
