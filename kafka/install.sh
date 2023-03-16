#!/bin/bash
set -euo pipefail

. properties.sh

helm repo add bitnami https://charts.bitnami.com/bitnami
helm install ${APP_NAME} bitnami/kafka -f values.yaml

oc adm policy add-scc-to-user -z default anyuid
oc adm policy add-scc-to-user -z frdemo-kafka anyuid

# Kafka can be accessed by consumers via port 9092 on the following DNS name from within your cluster:
#
#    frkafa-kafka.kwills-dev.svc.cluster.local
#
# Each Kafka broker can be accessed by producers via port 9092 on the following DNS name(s) from within your cluster:
#
#    frkafa-kafka-0.frkafa-kafka-headless.kwills-dev.svc.cluster.local:9092
#
# To create a pod that you can use as a Kafka client run the following commands:
#
#    kubectl run frkafa-kafka-client --restart='Never' --image docker.io/bitnami/kafka:3.4.0-debian-11-r6 --namespace kwills-dev --command -- sleep infinity
#    kubectl exec --tty -i frkafa-kafka-client --namespace kwills-dev -- bash
#
#    PRODUCER:
#        kafka-console-producer.sh \
#            --broker-list frkafa-kafka-0.frkafa-kafka-headless.kwills-dev.svc.cluster.local:9092 \
#            --topic test
#
#    CONSUMER:
#        kafka-console-consumer.sh \
#            --bootstrap-server frkafa-kafka.kwills-dev.svc.cluster.local:9092 \
#            --topic test \
#            --from-beginning

