#!/bin/bash

az aks get-credentials --resource-group rg-devops-task --name prod-devops-task --overwrite-existing

kubectl create namespace prod
kubectl apply -f apps/service-a --namespace prod
kubectl apply -f apps/service-b --namespace prod
kubectl apply -f apps/utils --namespace prod

timer=0
while true; do
    ADDRESS=$(kubectl get ingress -n prod ingress-main -o jsonpath='{.status.loadBalancer.ingress[0].ip}')

    if [ -n "$ADDRESS" ]; then
        echo "URL for service A: http://$ADDRESS/servicea"
        echo "URL for service A: http://$ADDRESS/serviceb"
        exit 0
    else
        echo "Waiting for ingress nginx load balancer IP..."
        sleep 2

        ((timer+=1))
        if [timer -eq 30]; then
            echo "Something went wrong :("
            exit 1
        fi
    fi
done