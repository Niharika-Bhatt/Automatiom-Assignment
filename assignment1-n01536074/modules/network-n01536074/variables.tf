variable "resource_group_name" {
  description = "rg name"
  type        = string
  default     = "6074-rg"
}

variable "resource_group_location" {
  description = "rg location"
  type        = string
  default     = "Canada Central"
}

variable "virtual_network_address_space" {
  description = "Virtual network as"
  type        = list(string)
 default     = ["10.0.0.0/16"]

}

variable "subnet_address_space" {
  description = "Subnet as"
  type        = list(string)
 default     = ["10.0.0.0/24"]

}


