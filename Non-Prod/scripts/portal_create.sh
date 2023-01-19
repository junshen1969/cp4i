#!/bin/bash

#******************************************************************************
# Usage:
#   ./portal_create.sh licensetype profile blockstorage portalAdminEndpoint portalUIEndpoint
#******************************************************************************

DIR=`dirname "$0"`

echo "----------------------------------------------------------------------"
echo " INFO: Create API Portal CR"
echo "----------------------------------------------------------------------"

licensetype=${1}
profile=${2}
blockstorage=${3}
portalAdminEndpoint=${4}
portalUIEndpoint=${5}

(echo "cat <<EOF" ; cat ../template/portal_tmpl.yaml ; echo EOF) | \
licensetype=${licensetype} \
profile=${profile} \
blockstorage=${blockstorage} \
portalAdminEndpoint=${portalAdminEndpoint} \
portalUIEndpoint=${portalUIEndpoint} \
sh > ../config/apic/portal.yaml

# oc apply -f ../config/namespace/ns_${namespace}.yaml
