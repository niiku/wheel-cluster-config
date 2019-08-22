# Strimzi Demo

Create Kafka Cluster (https://strimzi.io/docs/latest/#deploying-kafka-cluster-str)

```
apiVersion: kafka.strimzi.io/v1alpha1
kind: Kafka
metadata:
  name: playground-cluster
spec:
  kafka:
    replicas: 3
    listeners:
      plain: {}
      tls: {}
      external:
        type: route
    config:
      offsets.topic.replication.factor: 3
      transaction.state.log.replication.factor: 3
      transaction.state.log.min.isr: 2
    storage:
      type: persistent-claim
      size: 1Gi
      deleteClaim: false
  zookeeper:
    replicas: 3
    storage:
      type: persistent-claim
      size: 1Gi
      deleteClaim: false
  entityOperator:
    topicOperator: {}
    userOperator: {}
```

Create Kafka Topic

```
apiVersion: kafka.strimzi.io/v1alpha1
kind: KafkaTopic
metadata:
  name: playground-topic
  labels:
    strimzi.io/cluster: playground-cluster
spec:
  partitions: 10
  replicas: 3

```

Get CA Certificate:

```
oc extract -n playground secret/playground-cluster-cluster-ca-cert --keys ca.crt
```

Create Keystore with Password:
```
keytool -import -trustcacerts -alias root -file ca.crt -keystore keystore.jks -noprompt
```

Create client-ssl.properties:
```
KAFKA_BOOTSTRAP_URL=$(oc get -n playground route | grep bootstrap | awk '{print $2":443"'})
cat << EOF | tee client-ssl.properties
bootstrap.servers=$KAFKA_BOOTSTRAP_URL
security.protocol=SSL
ssl.truststore.location=keystore.jks
ssl.truststore.password=password
ssl.keystore.location=keystore.jks
ssl.keystore.password=password
ssl.key.password=
EOF
```
http://www.pirbot.com/mirrors/apache/kafka/2.3.0/kafka_2.11-2.3.0.tgz


Run console producer
```
KAFKA_BOOTSTRAP_URL=$(oc get -n playground route | grep bootstrap | awk '{print $2":443"'})
kafka/bin/kafka-console-producer.sh --broker-list $KAFKA_BOOTSTRAP_URL --topic playground-topic --producer.config client-ssl.properties
```

Run console consumer:
```
KAFKA_BOOTSTRAP_URL=$(oc get -n playground route | grep bootstrap | awk '{print $2":443"'})
kafka/bin/kafka-console-consumer.sh --bootstrap-server $KAFKA_BOOTSTRAP_URL --topic playground-topic --from-beginning --consumer.config client-ssl.properties
```