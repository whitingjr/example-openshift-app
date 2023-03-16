#!/bin/bash

set -euo pipefail

. ../eapxp4/properties.sh

oc -n ${NAMESPACE} replace --force -f operatorgroup.yaml
oc -n ${NAMESPACE} replace --force -f eap-operator-sub.yaml
