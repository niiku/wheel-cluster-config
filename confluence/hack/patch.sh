oc patch deployment confluence-server -p '{"spec":{"template":{"spec":{"containers":[{"name":"confluence","volumeMounts":[{"mountPath":"/entrypoint.py","name":"entrypoint","subPath":"entrypoint.py"}]}]}}}}'