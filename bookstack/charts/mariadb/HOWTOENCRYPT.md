```
kubeseal --cert ~/kubeseal/kubeseal.crt \
--namespace=bookstack \
< secrets.yaml.ignore > secrets-sealed-secret.json
```