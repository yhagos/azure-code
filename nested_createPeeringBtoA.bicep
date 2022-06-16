param variables_vnetBtoVnetAPeeringName ? /* TODO: fill in correct type */
param location string

@description('Name of the Second VNET')
param vnetBName string

@description('the Subscription ID for the first VNET')
param subscriptionAID string

@description('the resource group name for the first VNET')
param resourceGroupAName string

@description('Name of the first VNET')
param vnetAName string

@description('Prefix of the first VNET')
param vnetAPrefix string

module createNetworkPeeringfromB './nested_createNetworkPeeringfromB.bicep' = {
  name: 'createNetworkPeeringfromB'
  params: {
    vnetBName: vnetBName
    variables_vnetBtoVnetAPeeringName: variables_vnetBtoVnetAPeeringName
    subscriptionAID: subscriptionAID
    resourceGroupAName: resourceGroupAName
    vnetAName: vnetAName
    vnetAPrefix: vnetAPrefix
  }
}