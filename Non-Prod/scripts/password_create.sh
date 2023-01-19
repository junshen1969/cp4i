#!/bin/bash

#******************************************************************************
# Usage:
#   ./password_create.sh secretname NamespaceName cacrt tlscrt tlskey targetName
#******************************************************************************

DIR=`dirname "$0"`

echo "----------------------------------------------------------------------"
echo " INFO: Create Password Secret: ${1}"
echo "----------------------------------------------------------------------"

secretname=${1}
namespace=${2}

(echo "cat <<EOF" ; cat ../template/aws-secret_tmpl.yaml ; echo EOF) | \
secretname=${secretname} \
namespace=${namespace} \
sh > ../config/${namespace}/${secretname}-aws-secret.yaml

# oc apply -f ../config/namespace/ns_${namespace}.yaml
