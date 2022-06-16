
param workloadName string
param workloadAddressPrefix string 
param subnet1Prefix string 
param subnet1Name string 
param subnet2Prefix string 
param subnet2Name string 
param location string = resourceGroup().location

param hubvnetName string
param hubvnetId string

param routeTableName string
param routeName string
param routeAddressPrefix string
param routeNextHopIpAddress string
param routeNextHopType string

//param resourceGroupName string = '${workloadName}-rg'
param workloadVnet string = '${workloadName}-Vnet'


resource vnet 'Microsoft.Network/virtualNetworks@2021-02-01' = {
  name: workloadVnet
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        workloadAddressPrefix
      ]
    }
    subnets: [
      {
        name: subnet1Name
        properties: {
          addressPrefix: subnet1Prefix
        }
      }
      {
        name: subnet2Name
        properties: {
          addressPrefix: subnet2Prefix
        }
      }
    ]
  }
}

resource hubvnetexisting 'Microsoft.Network/virtualNetworks@2021-02-01' existing = {
  name: hubvnetName
}


resource peering1 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2021-02-01' = {
  name: '${workloadName}-${hubvnetName}'
  parent: vnet
  properties: {
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: false
    allowGatewayTransit: false
    useRemoteGateways: false
    peeringState:'Connected'
    remoteVirtualNetwork: {
      id: hubvnetId
  }
 }
}


resource routeTable 'Microsoft.Network/routeTables@2021-02-01' = {
  name: routeTableName
  location: location

  properties: {
    routes: [
      {
        name: routeName
        properties: {
          addressPrefix: routeAddressPrefix
          nextHopIpAddress: routeNextHopIpAddress
          nextHopType: routeNextHopType
        }
      }
    ]
  }
}


output peering1 string = peering1.name
//output peering2 string = peering2.name
output routeTableId string = routeTable.id
output routeTableName string = routeTable.name
output hubvnetexisting string = hubvnetexisting.id


