```
kubeseal --cert ~/kubeseal.crt --namespace=argocd < argocd-secret.yaml.ignore > argocd-sealed-secret.json
```