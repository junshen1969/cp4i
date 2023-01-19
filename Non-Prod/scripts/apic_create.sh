#!/bin/bash

#******************************************************************************
# Usage:
#   ./apic_create.sh licensetype profile blockstorage
#******************************************************************************

DIR=`dirname "$0"`

echo "----------------------------------------------------------------------"
echo " INFO: Create APIConnectCluster CR"
echo "----------------------------------------------------------------------"

licensetype=${1}
profile=${2}
blockstorage=${3}

(echo "cat <<EOF" ; cat ../template/apic_tmpl.yaml ; echo EOF) | \
licensetype=${licensetype} \
profile=${profile} \
blockstorage=${blockstorage} \
sh > ../config/apic/apic.yaml

# oc apply -f ../config/namespace/ns_${namespace}.yaml
