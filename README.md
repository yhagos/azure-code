# azure-code

 az account list
 az account set --subscription fe56f593-a6bb-4f83-9e0d-0e8a8f7593cb
 
 az deployment group create  --resource-group  rg-subA-001 --template-file  ./1-mainFromA.bicep --parameters ./1-main.parameters.json
 
 az account set --subscription c92c4306-7102-407d-81b2-6d8b93e979de
 
 az deployment group create  --resource-group  rg-subB-001 --template-file  ./1-mainFromB.bicep --parameters ./1-main.parameters.json

# subscription A
az account set --subscription fe56f593-a6bb-4f83-9e0d-0e8a8f7593cb

# subscription B
az account set --subscription c92c4306-7102-407d-81b2-6d8b93e979de

# Test create both peerings new approach!!e
az deployment group create  --location eastus --template-file  ./1-main.bicep --parameters ./1-main.parameters.json 
# create first peering
az deployment group create  --resource-group  rg-subA-001 --template-file  ./1-mainFromA.bicep --parameters ./1-main.parameters.json 

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
