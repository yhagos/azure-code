param variables_vnetAtoVnetBPeeringName ? /* TODO: fill in correct type */
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

module createNetworkPeeringfromA './nested_createNetworkPeeringfromA.bicep' = {
  name: 'createNetworkPeeringfromA'
  params: {
    vnetAName: vnetAName
    variables_vnetAtoVnetBPeeringName: variables_vnetAtoVnetBPeeringName
    subscriptionBID: subscriptionBID
    resourceGroupBName: resourceGroupBName
    vnetBName: vnetBName
    vnetBPrefix: vnetBPrefix
  }
}