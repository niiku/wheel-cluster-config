```
kubeseal --cert ~/kubeseal/kubeseal.crt \
--namespace=minio \
< minio-secret.yaml.ignore > minio-sealed-secret.json
```