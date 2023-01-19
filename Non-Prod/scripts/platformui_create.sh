#!/bin/bash

#******************************************************************************
# Usage:
#   ./platformui_create.sh secretname endpoint filestorage replicas
#******************************************************************************

DIR=`dirname "$0"`

echo "----------------------------------------------------------------------"
echo " INFO: Create Platform UI CR"
echo "----------------------------------------------------------------------"

secretname=${1}
endpoint=${2}
filestorage=${3}
replicas=${4}

(echo "cat <<EOF" ; cat ../template/platformui_tmpl.yaml ; echo EOF) | \
secretname=${secretname} \
endpoint=${endpoint} \
filestorage=${filestorage} \
replicas=${replicas} \
sh > ../config/platformui/platformui.yaml

# oc apply -f ../config/namespace/ns_${namespace}.yaml
