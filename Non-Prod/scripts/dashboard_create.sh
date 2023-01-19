#!/bin/bash

#******************************************************************************
# Usage:
#   ./dashboard_create.sh namespace licensetype filestorage replicas
#******************************************************************************

DIR=`dirname "$0"`

echo "----------------------------------------------------------------------"
echo " INFO: Create Integraton Dashboard CR"
echo "----------------------------------------------------------------------"

namespace=${1}
licensetype=${2}
filestorage=${3}
replicas=${4}

(echo "cat <<EOF" ; cat ../template/dashboard_tmpl.yaml ; echo EOF) | \
namespace=${namespace} \
licensetype=${licensetype} \
filestorage=${filestorage} \
replicas=${replicas} \
sh > ../config/${namespace}/dashboard.yaml

# oc apply -f ../config/namespace/ns_${namespace}.yaml
