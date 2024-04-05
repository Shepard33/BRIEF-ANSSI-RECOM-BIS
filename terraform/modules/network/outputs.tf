output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "vnet_subnets_names" {
  value = azurerm_subnet.subnets[*].name
}

output "vnet_subnets_ids" {
  value = azurerm_subnet.subnets[*].id
}