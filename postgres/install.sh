#!/bin/bash
set -euo pipefail

APP_NAME="fr-db"

helm repo add bitnami https://charts.bitnami.com/bitnami
helm install ${APP_NAME} bitnami/postgresql -f values.yaml


#     export POSTGRES_PASSWORD=$(kubectl get secret --namespace kwills-dev frdb-postgresql -o jsonpath="{.data.postgres-password}" | base64 -d)
#
# To connect to your database run the following command:
#
#    kubectl run frdb-postgresql-client --rm --tty -i --restart='Never' --namespace kwills-dev --image docker.io/bitnami/postgresql:15.2.0-debian-11-r5 --env="PGPASSWORD=$POSTGRES_PASSWORD" \
#      --command -- psql --host frdb-postgresql -U postgres -d postgres -p 5432
#
#    > NOTE: If you access the container using bash, make sure that you execute "/opt/bitnami/scripts/postgresql/entrypoint.sh /bin/bash" in order to avoid the error "psql: local user with ID 1001} does not exist"
#
# To connect to your database from outside the cluster execute the following commands:
#
#    kubectl port-forward --namespace kwills-dev svc/frdb-postgresql 5432:5432 &
#    PGPASSWORD="$POSTGRES_PASSWORD" psql --host 127.0.0.1 -U postgres -d postgres -p 5432
