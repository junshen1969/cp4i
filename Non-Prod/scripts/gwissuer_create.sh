#!/bin/bash

#******************************************************************************
# Usage:
#   ./gwissuer_create.sh namespace
#******************************************************************************

DIR=`dirname "$0"`

echo "----------------------------------------------------------------------"
echo " INFO: Create Gateway Issuer CR"
echo "----------------------------------------------------------------------"

namespace=${1}

(echo "cat <<EOF" ; cat ../template/common-issuer-and-gateway-certs_tmpl.yaml ; echo EOF) | \
namespace=${namespace} \
sh > ../config/${namespace}/common-issuer-and-gateway-certs.yaml

cp ../template/ingress-ca.yaml ../config/${namespace}/

# oc apply -f ../config/namespace/ns_${namespace}.yaml
