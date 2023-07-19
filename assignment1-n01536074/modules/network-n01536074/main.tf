resource "azurerm_virtual_network" "virtual_network" {
  name                = "N01536074-VNET"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  address_space       = var.virtual_network_address_space

  tags = {
    Assignment = "CCGC 5502 Automation Assignment"
    Name = "niharika.bhatt"
    ExpirationDate = "2024-12-31"
    Environment = "Learning"
  }
}

resource "azurerm_subnet" "virtual_network_subnet" {
  name                 = "N01536074-SUBNET"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes     = var.subnet_address_space
}

resource "azurerm_network_security_group" "network_sg" {
  name                = "N01536074-NSG"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "AllowSSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "ALLOWRDP"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "AllowWinRM"
    priority                   = 102
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "5985"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "AllowHTTP"
    priority                   = 103
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "subnet_nsg_association" {  
  subnet_id                 = azurerm_subnet.virtual_network_subnet.id
  network_security_group_id = azurerm_network_security_group.network_sg.id
}
