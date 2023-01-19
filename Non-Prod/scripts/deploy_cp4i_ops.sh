#!/bin/bash

#******************************************************************************
# Usage:
#   ./namespace_create.sh NamespaceName NodeLableName
#******************************************************************************

DIR=`dirname "$0"`

oc apply -f ../config/operator/subscription_cp4i.yaml

oc apply -f ../config/operator/subscription_asset.yaml

oc apply -f ../config/operator/subscription_apic.yaml

oc apply -f ../config/operator/subscription_ace.yaml

oc apply -f ../config/operator/subscription_mq.yaml
