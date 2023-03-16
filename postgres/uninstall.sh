#!/bin/bash
set -euo pipefail

. properties.sh

oc delete dc/${APP_NAME}
# helm uninstall ${APP_NAME}
