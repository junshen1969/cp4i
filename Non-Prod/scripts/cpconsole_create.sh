#!/bin/bash

#******************************************************************************
# Usage:
#   ./cpconsole_create.sh secretname endpoint
#******************************************************************************

DIR=`dirname "$0"`

echo "----------------------------------------------------------------------"
echo " INFO: Create cp console CR"
echo "----------------------------------------------------------------------"

secretname=${1}
endpoint=${2}

(echo "cat <<EOF" ; cat ../template/cs-onprem-tenant-config_tmpl.yaml ; echo EOF) | \
secretname=${secretname} \
endpoint=${endpoint} \
sh > ../config/cpconsole/cs-onprem-tenant-config.yaml

# oc apply -f ../config/namespace/ns_${namespace}.yaml
