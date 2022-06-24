#!/bin/bash

# VLOCATION="eastus"
# VHUBRESOURCEGROUP="yonastest1"
# VNETWORKLOAD="Workload-001"
# echo $VLOCATION
# echo $VHUBRESOURCEGROUP
# echo $VNETWORKLOAD
# echo "$VNETWORKLOAD-rg"
# az deployment sub create  --location $VLOCATION --template-file  ./main.bicep --parameters ./parameters/main.parameters.json 
# az deployment group create  --resource-group  "$VNETWORKLOAD-rg" --template-file  ./main.peeringFromWorkload.bicep --parameters ./parameters/peering.parameters.json
# az deployment group create --resource-group $VHUBRESOURCEGROUP --template-file ./main.peeringFromHub.bicep --parameters ./parameters/peering.parameters.json

RGA=$1
SUBAID=$2
RGB=$3
SUBBID=$4


# make sure both subsciptions exist
 az account list
 az account show  --subscription  $SUBAID
 az account show  --subscription  $SUBBID


# Now you can proceed first peering 
 az account set --subscription $SUBAID
 az deployment group create  --resource-group  $RGA --template-file  ./mainFromA.bicep --parameters ./main.parameters.json

# the reverse peering 
az account set --subscription $SUBBID
az deployment group create  --resource-group  $RGB --template-file  ./mainFromB.bicep --parameters ./main.parameters.json

