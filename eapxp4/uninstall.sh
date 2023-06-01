#!/bin/bash
set -euo pipefail

# source the env config, create this if it doesn't exist already
. properties.sh

# login to openshift
oc login --token=${AUTH_TOKEN} --server=${OPENSHIFT_URL}

# uninstall app
helm uninstall ${APP_NAME}
oc -n ${NAMESPACE} delete hpa/${APP_NAME}
