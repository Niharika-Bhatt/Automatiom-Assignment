variable "resource_group_name" {}

variable "resource_group_location" {}

variable "recovery_sv" {
  type                  = map(string)
  default               = {
    recovery_vault_name = "my-recoveryvault"
    recovery_sku        = "Standard"
  }
 }

variable "storage_account_tier" {
  default = "Standard"
}

variable "storage_account_replica" {
  default = "LRS"
}

variable "subnet_id" {}

