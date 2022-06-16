
param workloadName string
param hubvnetName string
param resourceGroupName string = '${workloadName}-rg'
param workloadVnet string = '${workloadName}-Vnet'


resource hubvnetexisting 'Microsoft.Network/virtualNetworks@2021-02-01' existing = {
  name: hubvnetName
}


resource workloadvnetexisting 'Microsoft.Network/virtualNetworks@2021-02-01' existing = {
  name: workloadVnet
}


resource peering2 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2021-02-01' = {
  name: '${hubvnetName}-${workloadName}'
  parent: hubvnetexisting
  properties: {
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: false
    allowGatewayTransit: false
    useRemoteGateways: false
    peeringState:'Connected'
    remoteVirtualNetwork: {
      id: '/subscriptions/5db106ba-450b-406d-9bd6-42521f38b59c/resourceGroups/${resourceGroupName}/providers/Microsoft.Network/virtualNetworks/${workloadVnet}'
  }
 }
}
