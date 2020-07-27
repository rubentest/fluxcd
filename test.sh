#!/bin/sh

error=0
BASEDIR=$(dirname "$0")

for i in $(ls -d ${BASEDIR}/overlays/*); do
  if [ -f ${i}/kustomization.yaml ]; then
    kustomize build ${i} >/dev/null 2>&1
    if [ $? -ne 0 ]; then
      echo "Error in ${i} - please review"
      error=1
    fi
  fi
done

if [ ${error} -eq 0 ]; then
  echo "All builds success! Good job :)"
fi