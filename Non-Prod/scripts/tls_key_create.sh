#!/bin/bash

#******************************************************************************
# Usage:
#   ./tls_key_create.sh secretname NamespaceName cacrt tlscrt tlskey targetName
#******************************************************************************

DIR=`dirname "$0"`

echo "----------------------------------------------------------------------"
echo " INFO: Create Secret: ${1}"
echo "----------------------------------------------------------------------"

secretname=${1}
namespace=${2}
awskey=${3}
cacrt=${4}
tlscrt=${5}
tlskey=${6}
targetname=${7}

(echo "cat <<EOF" ; cat ../template/aws-tls-secret_tmpl.yaml ; echo EOF) | \
secretname=${secretname} \
namespace=${namespace} \
awskey=${awskey} \
cacrt=${cacrt} \
tlscrt=${tlscrt} \
tlskey=${tlskey} \
sh > ../config/${targetname}/${secretname}-aws-tls-secret.yaml

# oc apply -f ../config/namespace/ns_${namespace}.yaml
