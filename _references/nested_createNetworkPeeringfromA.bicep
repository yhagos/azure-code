@description('Name of the first VNET')
param vnetAName string
param variables_vnetAtoVnetBPeeringName ? /* TODO: fill in correct type */

@description('the Subscription ID for the second VNET')
param subscriptionBID string

@description('the resource group name for the second VNET')
param resourceGroupBName string

@description('Name of the Second VNET')
param vnetBName string

@description('Prefix of the Second VNET')
param vnetBPrefix string

resource vnetAName_variables_vnetAtoVnetBPeeringName 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2020-05-01' = {
  name: '${vnetAName}/${variables_vnetAtoVnetBPeeringName}'
  properties: {
    peeringState: 'Connected'
    remoteVirtualNetwork: {
      id: '/subscriptions/${subscriptionBID}/resourceGroups/${resourceGroupBName}/providers/Microsoft.Network/virtualNetworks/${vnetBName}'
    }
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: true
    allowGatewayTransit: false
    useRemoteGateways: false
    remoteAddressSpace: {
      addressPrefixes: [
        vnetBPrefix
      ]
    }
  }
}