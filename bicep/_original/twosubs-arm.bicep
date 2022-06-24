
@description('Name of the first VNET')
param vnetAName string = 'ansuman-vnet'

@description('Name of the Second VNET')
param vnetBName string = 'vnet-ansuman'

@description('Prefix of the first VNET')
param vnetAPrefix string = '10.0.0.0/16'

@description('Prefix of the Second VNET')
param vnetBPrefix string = '10.1.0.0/16'

@description('the Subscription ID for the first VNET')
param subscriptionAID string = 'subA'

@description('the resource group name for the first VNET')
param resourceGroupAName string = 'ansumantest'

@description('the Subscription ID for the second VNET')
param subscriptionBID string = 'subB'

@description('the resource group name for the second VNET')
param resourceGroupBName string = 'rgB'
param location string = 'West US 2'

var vnetAtoVnetBPeeringName = '${vnetAName}-to-${vnetBName}'
var vnetBtoVnetAPeeringName = '${vnetBName}-to-${vnetAName}'

module createPeeringAtoB './nested_createPeeringAtoB.bicep' = {
  name: 'createPeeringAtoB'
  scope: subscription(subscriptionAID)
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

module createPeeringBtoA './nested_createPeeringBtoA.bicep' = {
  name: 'createPeeringBtoA'
  scope: subscription(subscriptionBID)
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
