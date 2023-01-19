#!/bin/bash

#******************************************************************************
# Usage:
#   ./namespace_create.sh NamespaceName NodeLableName
#******************************************************************************

DIR=`dirname "$0"`

namespaceArray=("dpgw-ci1" "dpgw-dv1" "dpgw-ts1" "dpgw-ts2" "dpgw-ts3" "dpgw-ts4" "dpgw-ts5" "dpgw-sv1" "dpgw-ps1" "dpgw-tr2")

for val in ${namespaceArray[*]}; do
  mkdir -p ../config/${val}
  ./datapower_create.sh ${val} nonproduction 1
  ./password_create.sh admin ${val}
done
