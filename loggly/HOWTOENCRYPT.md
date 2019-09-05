```
kubeseal --cert ~/kubeseal/kubeseal.crt \
--namespace=guacamole \
< logspout-config-secret.yaml.ignore > logspout-config-sealed-secret.json
```