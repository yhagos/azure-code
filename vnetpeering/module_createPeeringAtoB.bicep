
param variables_vnetAtoVnetBPeeringName string

param location string

@description('Name of the first VNET')
param vnetAName string

@description('the Subscription ID for the second VNET')
param subscriptionBID string

@description('the resource group name for the second VNET')
param resourceGroupBName string

@description('Name of the Second VNET')
param vnetBName string

@description('Prefix of the Second VNET')
param vnetBPrefix string

module createNetworkPeeringfromA 'resource_createNetworkPeeringfromA.bicep' = {
  name: 'createNetworkPeering-from-${vnetAName}'
  params: {
    vnetAName: vnetAName
    variables_vnetAtoVnetBPeeringName: variables_vnetAtoVnetBPeeringName
    subscriptionBID: subscriptionBID
    resourceGroupBName: resourceGroupBName
    vnetBName: vnetBName
    vnetBPrefix: vnetBPrefix
  }
}
