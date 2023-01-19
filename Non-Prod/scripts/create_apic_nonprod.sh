#!/bin/bash

#******************************************************************************
# Usage:
#   ./namespace_create.sh NamespaceName NodeLableName
#******************************************************************************

DIR=`dirname "$0"`

./tls_key_create.sh portal apic certs/apic/api-portal ca_crt tls_crt tls_key apic
./namespace_create.sh apic apic nodeuse/apic=true
./apic_create.sh nonproduction n3xc12.m40 gp3-customer-kms
./portal_create.sh nonproduction n3xc4.m8 gp3-customer-kms api-padmin-apic.apps.???.com api-portal.apic.iop-np.rosa.workcover.vic.gov.au
./apic_kustomization_create.sh apic
