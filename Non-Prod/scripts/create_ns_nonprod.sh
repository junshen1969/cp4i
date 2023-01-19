#!/bin/bash

#******************************************************************************
# Usage:
#   ./namespace_create.sh NamespaceName NodeLableName
#******************************************************************************

DIR=`dirname "$0"`

./namespace_create.sh apic nodeuse/apic=true

#./namespace_create.sh cp4i nodeuse/apic=false

apigwArray=("apigw-ci1" "apigw-dv1" "apigw-ts1" "apigw-ts2" "apigw-ts3" "apigw-ts4" "apigw-ts5" "apigw-sv1" "apigw-ps1" "apigw-tr2")

for val in ${apigwArray[*]}; do
  ./namespace_create.sh ${val} nodeuse/apic=false
done

acemqArray=("acemq-ci1" "acemq-dv1" "acemq-ts1" "acemq-ts2" "acemq-ts3" "acemq-ts4" "acemq-ts5" "acemq-sv1" "acemq-ps1" "acemq-tr2")
for val in ${acemqArray[*]}; do
  ./namespace_create.sh ${val} nodeuse/apic=false
done

dpgwArray=("dpgw-ci1" "dpgw-dv1" "dpgw-ts1" "dpgw-ts2" "dpgw-ts3" "dpgw-ts4" "dpgw-ts5" "dpgw-sv1" "dpgw-ps1" "dpgw-tr2")
for val in ${dpgwArray[*]}; do
  ./namespace_create.sh ${val} nodeuse/apic=false
done
