#!/bin/bash

#******************************************************************************
# Usage:
#   ./datapower_create.sh namespace licensetype replicas
#******************************************************************************

DIR=`dirname "$0"`

echo "----------------------------------------------------------------------"
echo " INFO: Create DataPower CR"
echo "----------------------------------------------------------------------"

namespace=${1}
licensetype=${2}
replicas=${3}

(echo "cat <<EOF" ; cat ../template/datapower_tmpl.yaml ; echo EOF) | \
namespace=${namespace} \
licensetype=${licensetype} \
replicas=${replicas} \
sh > ../config/${namespace}/datapower.yaml

(echo "cat <<EOF" ; cat ../template/web-mgmt-configmap_tmpl.yaml ; echo EOF) | \
namespace=${namespace} \
sh > ../config/${namespace}/web-mgmt-configmap.yaml

(echo "cat <<EOF" ; cat ../template/dp_service_tmpl.yaml ; echo EOF) | \
namespace=${namespace} \
sh > ../config/${namespace}/service.yaml

(echo "cat <<EOF" ; cat ../template/dp_kustomization_tmpl.yaml ; echo EOF) | \
namespace=${namespace} \
sh > ../config/${namespace}/kustomization.yaml

# oc apply -f ../config/namespace/ns_${namespace}.yaml
