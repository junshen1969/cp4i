#!/bin/bash

#******************************************************************************
# Usage:
#   ./namespace_create.sh NamespaceName NodeLableName
#******************************************************************************

DIR=`dirname "$0"`

./tls_key_create.sh cpconsle ibm-common-services cpconsle-cacrt cpconsle-tlscrt cpconsle-tlskey cpconsle
./tls_key_create.sh portal apic portal-cacrt portal-tlscrt portal-tlskey apic
