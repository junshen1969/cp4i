#!/bin/bash

#******************************************************************************
# Usage:
#   ./asset_create.sh filestorage blockstorage replicas
#******************************************************************************

DIR=`dirname "$0"`

echo "----------------------------------------------------------------------"
echo " INFO: Create Asset CR"
echo "----------------------------------------------------------------------"

filestorage=${1}
blockstorage=${2}
replicas=${3}

(echo "cat <<EOF" ; cat ../template/asset_tmpl.yaml ; echo EOF) | \
blockstorage=${blockstorage} \
filestorage=${filestorage} \
replicas=${replicas} \
sh > ../config/asset/asset.yaml

# oc apply -f ../config/namespace/ns_${namespace}.yaml
