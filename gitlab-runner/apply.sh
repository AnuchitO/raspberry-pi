#!/bin/bash
kubectl apply -f service-account.yaml
kubectl apply -f configmap.yaml
kubectl apply -f deployment.yaml