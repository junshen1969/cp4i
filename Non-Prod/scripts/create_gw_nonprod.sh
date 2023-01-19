#!/bin/bash

#******************************************************************************
# Usage:
#   ./namespace_create.sh NamespaceName NodeLableName
#******************************************************************************

DIR=`dirname "$0"`

namespaceArray=("apigw-ci1" "apigw-dv1" "apigw-ts1" "apigw-ts2" "apigw-ts3" "apigw-ts4" "apigw-ts5" "apigw-sv1" "apigw-ps1" "apigw-tr2")

for val in ${namespaceArray[*]}; do
  mkdir -p ../config/${val}
  ./namespace_create.sh ${val} ${val}
  ./gwissuer_create.sh ${val}
  ./gw_create.sh ${val} nonproduction n3xc4.m8 gp3-customer-kms gwd-a${val}.apps.???.com ${val}.iop-np.rosa.workcover.vic.gov.au
  ./password_create.sh admin ${val}
  ./gw_kustomization_create.sh ${val}
done
