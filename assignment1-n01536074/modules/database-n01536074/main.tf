resource "azurerm_postgresql_server" "postgresql_server" {
  name                = "posqlserver6074"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  sku_name = "B_Gen5_2"

  storage_mb                   = 5120
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  auto_grow_enabled            = true

  administrator_login          = var.db_user_name
  administrator_login_password = var.db_password
  version                      = var.db_version
  ssl_enforcement_enabled      = true

  tags = {
    Assignment = "CCGC 5502 Automation Assignment"
    Name = "niharika.bhatt"
    ExpirationDate = "2024-12-31"
    Environment = "Learning"
  }
}

