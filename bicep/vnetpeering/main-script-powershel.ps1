

$RGA = $args[0]
$SUBAID = $args[1]
$RGB = $args[2]
$SUBBID = $args[3]

connect-AzAccount -TenantId '72f988bf-86f1-41af-91ab-2d7cd011db47'


Get-AzureSubscription list
Set-AzureSubscription --subscription $SUBAID
Get-AzResourceGroupDeployment --resource-group $RGA --template-file ./mainFromA.bicep --parameters /main.parameters.json



Get-AzureSubscription list
Set-AzureSubscription --subscription $SUBBID 
Get-AzResourceGroupDeployment --resource-group $RGB --template-file ./mainFromA.bicep --parameters /main.parameters.json

