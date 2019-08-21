```
kubeseal --cert ~/kubeseal.crt --namespace=confluence < postgresql-secret.yaml.ignore > postgresql-sealed-secret.json
```