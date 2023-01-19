#!/bin/bash

#******************************************************************************
# Usage:
#   ./namespace_create.sh NamespaceName NodeLableName
#******************************************************************************

DIR=`dirname "$0"`

namespaceArray=("iop-ci1" "iop-dv1" "iop-ts1" "iop-ts2" "iop-ts3" "iop-ts4" "iop-ts5" "iop-sv1" "iop-ps1" "iop-tr2")

for val in ${namespaceArray[*]}; do
  mkdir -p ../config/${val}
  ./namespace_create.sh ${val} ${val}
  ./dashboard_create.sh ${val} CloudPakForIntegrationNonProduction aws-efs 2
  ./db_kustomization_create.sh ${val}
done
