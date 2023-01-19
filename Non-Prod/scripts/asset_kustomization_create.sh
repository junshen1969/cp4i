#!/bin/bash

#******************************************************************************
# Usage:
#   ./gw_kustomization_create.sh NamespaceName
#******************************************************************************

DIR=`dirname "$0"`

echo "----------------------------------------------------------------------"
echo " INFO: Create Kustomization CR: ${1}"
echo "----------------------------------------------------------------------"

namespace=${1}

(echo "cat <<EOF" ; cat ../template/asset_kustomization_tmpl.yaml ; echo EOF) | \
namespace=${namespace} \
sh > ../config/asset/kustomization.yaml

# oc apply -f ../config/namespace/ns_${namespace}.yaml
