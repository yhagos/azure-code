
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

module createPeeringAtoB 'module_createPeeringAtoB.bicep' = {
  name: 'createPeering-${vnetAName}-to-${vnetBName}'
  // scope: subscription(subscriptionAID)
  params: {
    variables_vnetAtoVnetBPeeringName: vnetAtoVnetBPeeringName
    location: location
    vnetAName: vnetAName
    subscriptionBID: subscriptionBID
    resourceGroupBName: resourceGroupBName
    vnetBName: vnetBName
    vnetBPrefix: vnetBPrefix
  }
}
