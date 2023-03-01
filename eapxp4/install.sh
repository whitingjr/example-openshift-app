#!/bin/bash
set -euo pipefail

# source the env config, create this if it doesn't exist already
. properties.sh

# login to openshift
oc login --token=${AUTH_TOKEN} --server=${OPENSHIFT_URL}

# create pull secret
oc create secret docker-registry eap-pull-secret --docker-server=${DOCKER_SERVER} --docker-username=${USERNAME} --docker-password=${PASSWORD} --docker-email=${EMAIL} || true

# fetch EAP XP 4 helm charts:
wget ${HELM_CHARTS_URL}/${HELM_CHARTS_VERSION}/${HELM_CHARTS_VERSION}.tgz -O ${HELM_CHARTS_VERSION}.tgz

# helm install the app
helm install ${APP_NAME} ${HELM_CHARTS_VERSION}.tgz -f app.yaml

