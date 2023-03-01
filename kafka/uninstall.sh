#!/bin/bash
set -euo pipefail

. properties.sh

helm uninstall ${APP_NAME}
