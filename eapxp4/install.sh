#!/bin/bash
set -euo pipefail

# source the env config, create this if it doesn't exist already
. properties.sh

# login to openshift
oc login --token=${AUTH_TOKEN} --server=${OPENSHIFT_URL}

# create pull secret
oc create secret docker-registry eap-pull-secret --docker-server=${DOCKER_SERVER} --docker-username=${USERNAME} --docker-password=${PASSWORD} --docker-email=${EMAIL} || true

# helm install the app
helm install ${APP_NAME} -f app.yaml --repo https://jbossas.github.io/eap-charts eap-xp4
