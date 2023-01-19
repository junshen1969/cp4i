#!/bin/bash

#******************************************************************************
# Usage:
#   ./gateway_create.sh namespace licensetype profile blockstorage gatewayManagerEndpoint gatewayEndpoint
#******************************************************************************

DIR=`dirname "$0"`

echo "----------------------------------------------------------------------"
echo " INFO: Create API Gateway CR"
echo "----------------------------------------------------------------------"

namespace=${1}
licensetype=${2}
profile=${3}
blockstorage=${4}
gatewayManagerEndpoint=${5}
gatewayEndpoint=${6}

(echo "cat <<EOF" ; cat ../template/apigateway_tmpl.yaml ; echo EOF) | \
namespace=${namespace} \
licensetype=${licensetype} \
profile=${profile} \
blockstorage=${blockstorage} \
gatewayManagerEndpoint=${gatewayManagerEndpoint} \
gatewayEndpoint=${gatewayEndpoint} \
sh > ../config/${namespace}/apigateway.yaml

# oc apply -f ../config/namespace/ns_${namespace}.yaml
