```
kubeseal --cert ~/kubeseal/kubeseal.crt --namespace=argocd < argocd-secret.yaml.ignore > argocd-sealed-secret.json
```