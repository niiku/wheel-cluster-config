```
kubeseal --cert ~/kubeseal/kubeseal.crt \
--namespace=guacamole \
< mysql-secret.yaml.ignore > mysql-sealed-secret.json
```