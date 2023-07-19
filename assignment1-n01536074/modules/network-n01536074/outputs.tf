output "vnet_subnet_name" {
  value = azurerm_subnet.virtual_network_subnet
}

output "vnet_sg_name" {
  value = azurerm_network_security_group.network_sg
}

output "vnet_name" {
  value = azurerm_virtual_network.virtual_network
}


