#!/bin/bash

#******************************************************************************
# Usage:
#   ./namespace_create.sh NamespaceName ConfigFolder NodeLableName
#******************************************************************************

DIR=`dirname "$0"`

echo "----------------------------------------------------------------------"
echo " INFO: Create Namespace: ${1}"
echo "----------------------------------------------------------------------"

namespace=${1}
folder=${2}

if [ "$#" == "2" ]; then
  (echo "cat <<EOF" ; cat ../template/namespace_general_tmpl.yaml ; echo EOF) | \
  namespace=${namespace} \
  folder=${folder} \
  sh > ../config/${folder}/namespace.yaml
else
  nodelabel=${3}
  (echo "cat <<EOF" ; cat ../template/namespace_nodeselect_tmpl.yaml ; echo EOF) | \
  namespace=${namespace} \
  folder=${folder} \
  nodelabel=${nodelabel} \
  sh > ../config/${folder}/namespace.yaml
fi

# oc apply -f ../config/namespace/ns_${namespace}.yaml
