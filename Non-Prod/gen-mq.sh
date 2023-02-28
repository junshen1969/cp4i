#!/bin/bash
#******************************************************************************
# Licensed Materials - Property of IBM
# (c) Copyright IBM Corporation 2020. All Rights Reserved.
#
# Note to U.S. Government Users Restricted Rights:
# Use, duplication or disclosure restricted by GSA ADP Schedule
# Contract with IBM Corp.
#******************************************************************************

DIR=`dirname "$0"`

## indent content in file
#sed  's/^/    /'  ./config/config.mqsc > ./config/indented_config.mqsc
#sed  's/^/    /'  ./config/qm.ini > ./config/indented_qm.ini

## generate yaml
( echo "cat <<EOF" ; cat ./configmap-mq.yaml.tmpl; echo EOF ) | \
config_mqsc=$(cat ./indented_mq-config-objects.mqsc) \
env_mqsc=$(cat ./indented_mq-env-objects.mqsc) \
qm_ini=$(cat ./indented_qm.ini) \
sh > ./configmap-mq.yaml


