#!/bin/bash

#******************************************************************************
# Usage:
#   ./namespace_create.sh NamespaceName NodeLableName
#******************************************************************************

DIR=`dirname "$0"`

./asset_create.sh aws-efs gp3-customer-kms 1
./asset_kustomization_create.sh cp4i
