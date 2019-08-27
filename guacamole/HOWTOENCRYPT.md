```
kubeseal --cert ~/kubeseal/kubeseal.crt \
--namespace=minio \
< mysql-secret.yaml.ignore > mysql-sealed-secret.json
```