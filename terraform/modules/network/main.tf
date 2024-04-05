# Définition d'un réseau virtuel
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name           # "b2e1-gr5-vnet-westeu"
  address_space       = var.address_space       # ["10.0.0.0/16"]
  location            = var.location            # "westeurope" 
  resource_group_name = var.resource_group_name # "b2e1-gr5"

}


# # Définition d'un sous-réseau
resource "azurerm_subnet" "subnets" {
  count                = length(var.subnets)      ## ["aks" "app-gw"] = 2
  name                 = var.subnets[count.index] ## [0] & [1]
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [cidrsubnet(azurerm_virtual_network.vnet.address_space[0], 8, count.index)]

  depends_on = [azurerm_virtual_network.vnet]
}