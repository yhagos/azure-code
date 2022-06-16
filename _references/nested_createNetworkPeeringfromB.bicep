@description('Name of the Second VNET')
param vnetBName string
param variables_vnetBtoVnetAPeeringName ? /* TODO: fill in correct type */

@description('the Subscription ID for the first VNET')
param subscriptionAID string

@description('the resource group name for the first VNET')
param resourceGroupAName string

@description('Name of the first VNET')
param vnetAName string

@description('Prefix of the first VNET')
param vnetAPrefix string

resource vnetBName_variables_vnetBtoVnetAPeeringName 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2020-05-01' = {
  name: '${vnetBName}/${variables_vnetBtoVnetAPeeringName}'
  properties: {
    peeringState: 'Connected'
    remoteVirtualNetwork: {
      id: '/subscriptions/${subscriptionAID}/resourceGroups/${resourceGroupAName}/providers/Microsoft.Network/virtualNetworks/${vnetAName}'
    }
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: true
    allowGatewayTransit: false
    useRemoteGateways: false
    remoteAddressSpace: {
      addressPrefixes: [
        vnetAPrefix
      ]
    }
  }
}