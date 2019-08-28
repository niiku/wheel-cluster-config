```
kubeseal --cert ~/kubeseal/kubeseal.crt \
--namespace=build \
< github-webhook-secret.yaml.ignore > github-webhook-sealed-secret.json
```