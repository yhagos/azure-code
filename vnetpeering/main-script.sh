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



RGA="rg-subA-001"
RGB="rg-subB-001"
SUBAID="fe56f593-a6bb-4f83-9e0d-0e8a8f7593cb"
SUBBID="c92c4306-7102-407d-81b2-6d8b93e979de"


 az account list
 az account set --subscription $SUBAID
 az deployment group create  --resource-group  $RGA --template-file  ./mainFromA.bicep --parameters ./main.parameters.json
 
 az account set --subscription $SUBBID
 az deployment group create  --resource-group  $RGB --template-file  ./mainFromB.bicep --parameters ./main.parameters.json
