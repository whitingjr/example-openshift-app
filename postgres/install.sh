#!/bin/bash
set -euo pipefail

APP_NAME="frdemo-db"

oc new-app postgresql-ephemeral \
   -p DATABASE_SERVICE_NAME=${APP_NAME} \
   -p POSTGRESQL_DATABASE=frdemo \
   -p POSTGRESQL_PASSWORD=frdemo
