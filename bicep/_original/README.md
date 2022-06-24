===========================================
Old readme Original
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
