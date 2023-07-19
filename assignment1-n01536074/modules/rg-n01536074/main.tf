resource "azurerm_resource_group" "resource_group" {
  name                = var.resource_group_name
  location            = var.resource_group_location
  
  tags = {
    Assignment = "CCGC 5502 Automation Assignment"
    Name = "niharika.bhatt"
    ExpirationDate = "2024-12-31"
    Environment = "Learning"
  }
}

