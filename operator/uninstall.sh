#!/bin/bash

set -uo pipefail

OPERATOR=`oc get csv | tail -1 | grep eap-operator | awk '{print $1}'`
oc delete csv/${OPERATOR}
