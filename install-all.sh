#!/bin/bash

set -eo pipefail

dirs=('operator' 'postgres' 'kafka' 'eapxp4')
for dir in ${dirs[@]}
 do
  echo ============================
  echo Installing from: ${dir}
  echo ============================
  pushd ${dir}
  echo Running install.sh in `pwd`
  ./install.sh
  popd > /dev/null
  echo
 done
