# azure-code

RGA=$1
SUBAID=$2
RGB=$3
SUBBID=$4

 az account list
 az account set --subscription $SUBAID
 az deployment group create  --resource-group  $RGA --template-file  ./mainFromA.bicep --parameters ./main.parameters.json
 
 az account set --subscription $SUBBID
 az deployment group create  --resource-group  $RGB --template-file  ./mainFromB.bicep --parameters ./main.parameters.json

# USAGE:

# from the vnetpeering folder using terminal (bash) 

./main-script.sh  rg-subA-001  fe56f593-a6bb-4f83-9e0d-0e8a8f7593cb  rg-subB-001  c92c4306-7102-407d-81b2-6d8b93e979de



===========================================
Old readme
==============================================

#!/bin/bash

VLOCATION="eastus"
VHUBRESOURCEGROUP="yonastest1"
VNETWORKLOAD="Workload-001"

echo $VLOCATION
echo $VHUBRESOURCEGROUP
echo $VNETWORKLOAD
echo "$VNETWORKLOAD-rg"

# create vnet and route table
az deployment sub create  --location $VLOCATION --template-file  ./main.bicep --parameters ./parameters/main.parameters.json 

# create first peering
az deployment group create  --resource-group  "$VNETWORKLOAD-rg" --template-file  ./main.peeringFromWorkload.bicep --parameters ./parameters/peering.parameters.json

# create second peering
az deployment group create --resource-group $VHUBRESOURCEGROUP --template-file ./main.peeringFromHub.bicep --parameters ./parameters/peering.parameters.json
