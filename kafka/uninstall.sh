#!/bin/bash
set -euo pipefail

. properties.sh

helm uninstall ${APP_NAME}
oc adm policy remove-scc-from-user -z default anyuid
oc adm policy remove-scc-from-user -z frdemo-kafka anyuid

