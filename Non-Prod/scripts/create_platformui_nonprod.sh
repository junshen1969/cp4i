#!/bin/bash

#******************************************************************************
# Usage:
#   ./namespace_create.sh NamespaceName NodeLableName
#******************************************************************************

DIR=`dirname "$0"`

./tls_key_create.sh platformui cp4i certs/cp4i/cp-platform-ui ca_crt tls_crt tls_key platformui
./namespace_create.sh cp4i platformui
./platformui_create.sh platformui cp-platform-ui.cp4i.iop-np.rosa.workcover.vic.gov.au aws-efs 3
./platformui_kustomization_create.sh cp4i
