
@description('Name of the first VNET')
param vnetAName string 

@description('Name of the Second VNET')
param vnetBName string 

@description('Prefix of the first VNET')
param vnetAPrefix string 

@description('Prefix of the Second VNET')
param vnetBPrefix string 

@description('the Subscription ID for the first VNET')
param subscriptionAID string 

@description('the resource group name for the first VNET')
param resourceGroupAName string 

@description('the Subscription ID for the second VNET')
param subscriptionBID string 

@description('the resource group name for the second VNET')
param resourceGroupBName string 
param location string 

var vnetAtoVnetBPeeringName = '${vnetAName}-to-${vnetBName}'
var vnetBtoVnetAPeeringName = '${vnetBName}-to-${vnetAName}'


module createPeeringBtoA  'module_createPeeringBtoA.bicep' = {
  name: 'createPeering-${vnetBName}-to-${vnetAName}'
  // scope: subscription(subscriptionBID)
  params: {
    variables_vnetBtoVnetAPeeringName: vnetBtoVnetAPeeringName
    location: location
    vnetBName: vnetBName
    subscriptionAID: subscriptionAID
    resourceGroupAName: resourceGroupAName
    vnetAName: vnetAName
    vnetAPrefix: vnetAPrefix
  }
}
