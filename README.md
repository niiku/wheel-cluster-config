# Wheel OKD Cluster Configuration Repository 
This is the Git repository which contains all deployments in the Wheel [OKD](https://okd.io) cluster

# How does it work?
[ArgoCD](https://argoproj.github.io/argo-cd/) is used to sync directories with deployment configuration to the OKD cluster. ArgoCD itself is managed with this repository too. 

[Sealed-Secrets](https://github.com/bitnami-labs/sealed-secrets) is a way to encrypt Secrets safely in Git. 
